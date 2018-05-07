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

  # self.create is a class method
  def self.create
    # self.new is the same as saying Song.new.
    # self refers to the class (since it's inside a class method)
    song = self.new
    # it is being saved by calling the instance method 'song' above
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    # returns matching song instance
    self.all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song_array = filename.split("-").collect { |i| i.strip }

    song.name = song_array[1].gsub(/.mp3/, "")
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
