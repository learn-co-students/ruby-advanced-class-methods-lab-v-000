require "pry"

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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name (name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name (name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.new_from_filename (filename)
    data = filename.split ( /[-.]+/)
    new_song = Song.new_by_name (data[1].strip)
    new_song.artist_name = data[0].strip
    new_song
  end

  def self.create_from_filename (filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.find_by_name (name)
    self.all.detect do | song |
      song.name == name
    end
  end

  def self.find_or_create_by_name (name)
    new_song = Song.find_by_name(name) || Song.create_by_name(name)
    new_song
  end

  def self.alphabetical
    self.all.sort { | a, b | a.name <=> b.name }
  end

  def self.destroy_all
    self.all.clear
  end
end
