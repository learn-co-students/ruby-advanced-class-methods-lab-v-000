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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(song_file)
    #file ex: ("Taylor Swift - Blank Space.mp3")
    arr = song_file.split(" - ")
    artist_name = arr[0]
    song_file = arr[1].split(".")
    name = song_file[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_file)
    arr = song_file.split(" - ")
    artist_name = arr[0]
    song_file = arr[1].split(".")
    name = song_file[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end


end
