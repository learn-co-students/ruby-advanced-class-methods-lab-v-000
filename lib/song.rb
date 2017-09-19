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
    name = self.new
    @@all << name
    name
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    create_by_name(name)
  end

  def self.alphabetical
    all.sort_by{|word| word.name}
  end

  def self.new_from_filename(name)
    song = self.new

    song.name = name.split('-').last.chomp(".mp3").strip
    song.artist_name = name.split('-').first.strip
    song
  end

  def self.create_from_filename(name)
    song = self.new_by_name(name)

    song.name = name.split('-').last.chomp(".mp3").strip
    song.artist_name = name.split('-').first.strip
    song.save
  end

  def self.destroy_all
    all.clear
  end

end
