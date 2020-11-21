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
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    return new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    self.all << new_song
    return new_song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(/( - |\.)/)
    new_song = self.new
    new_song.name = data[2]
    new_song.artist_name = data[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
  end

  def self.destroy_all
    @@all = []
  end

end
