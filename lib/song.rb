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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    @@all << song
    song
  end

  def self.find_by_name(title)
    self.all.detect do |song| song.name == title end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end

  def self.new_from_filename(song_name)
    song_array = song_name.split(" - ")
    artist = song_array[0]
    song = song_array[1].gsub(".mp3", "")

    new = self.new
    new.name = song
    new.artist_name = artist
    new
  end

  def self.create_from_filename(song_name)
    song_array = song_name.split(" - ")
    artist = song_array[0]
    song = song_array[1].gsub(".mp3", "")

    new = self.create
    new.name = song
    new.artist_name = artist
  end

  def self.destroy_all
    @@all.clear
  end

end





