require "pry"

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    # Yields the new instance to the block, and then returns new instance as well.
    #self.new.tap --> barewords fall through to methods
    new.tap { |it| it.save }
  end

  #def self.new
  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(name)
    new(name).tap { |it| it.save }
  end

  def self.find_by_name(find_name)
    self.all.detect { |song| song.name == find_name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(name)
    match_data = /(?<artist>.*) - (?<song>.*).mp3/.match name
    new(match_data[:song], match_data[:artist])

  end

  def self.create_from_filename(name)
    song_name = new_from_filename(name).name
    art_name = new_from_filename(name).artist_name
    new(song_name, art_name).save
  end

  def self.destroy_all
    all.clear
  end

  def initialize(name = "Song not found", artist_name = "trailer swift")
    @name = name
    @artist_name = artist_name
  end

  def save
    self.class.all << self
  end
end
