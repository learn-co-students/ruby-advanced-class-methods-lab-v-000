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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song_title = file[1].slice(0..-5)
    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    artist = file[0]
    song_title = file[1].slice(0..-5)
    new_song = self.create
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
