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
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    artist_and_song = filename.split(/\-|\./).map {|artist_song| artist_song.lstrip.rstrip}
    new_song.artist_name = artist_and_song[0]
    new_song.name = artist_and_song[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new
    artist_and_song = filename.split(/\-|\./).map {|artist_song| artist_song.lstrip.rstrip}
    new_song.artist_name = artist_and_song[0]
    new_song.name = artist_and_song[1]
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

new_song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
