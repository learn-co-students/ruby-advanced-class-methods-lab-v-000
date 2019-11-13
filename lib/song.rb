require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(songname)

    self.all.detect {|song| song.name == songname}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.each.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    track = parsed[1].split(".")
    song = create_by_name(track[0])
    song.artist_name=parsed[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
