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
    new_song = self.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    @@all << new_song
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|n| n.name}
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
