require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new

    @@all << song

    song
  end

  def initialize

  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    song = self.new
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = name
    if song = self.find_by_name(name)
    else song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
     @@all.sort_by{|a| a.name.downcase}
  end

  def self.new_from_filename(filename)
    file = filename.split("-")
    artist = file[0].strip
    song = file[1].gsub(".mp3", "").strip
     #binding.pry
     new_song = self.create_by_name(song)
     new_song.artist_name = artist
     new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end
end
