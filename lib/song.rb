require 'pry'

class Song
  attr_accessor :name, :artist_name
  
  ### CLASS VARIABLES ###

  @@all = []

  ### CLASS METHODS ###

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if !@@all.include?(song_name)
      song = Song.new
      song.name = song_name
      song.save
      song
    else
      @@all.find {|song| song.name == song_name}
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.name = filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    song.name = filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

  ### INSTANCE METHODS ###

  def save
    self.class.all << self
  end

end