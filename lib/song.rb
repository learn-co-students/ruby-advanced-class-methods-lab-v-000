require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create #=> constructor
    song = self.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new #=> creates a new instance of song -- not saved
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|word| word.name.downcase}
  end

  def self.new_from_filename(name)
    #argument string = "Taylor Swift - Blank Space.mp3"
    #parse the string
    array = name.split(" - ") #=> will return and array of ["Taylor Swift", "Blank Space.mp3"]
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "") #=> replaces the ".mp3" with nothing

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    array = name.split(" - ") #=> will return and array of ["Taylor Swift", "Blank Space.mp3"]
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "") #=> replaces the ".mp3" with nothing

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end

end
