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

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.create_by_name(song_title)
    song = self.new_by_name(song_title)
  end

  def self.find_by_name(song_title)
    @@all.detect{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    if @@all.include?(song_title)
      self.find_by_name(song_title)
    else
      self.create_by_name(song_title)
    end
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    artist_song = filename.split(" - ")
    artist = artist_song[0]
    song_fix = artist_song[1].split(".")
    song_title = song_fix[0]
    song = Song.new
    song.name = song_title
    song.artist_name = artist
    song.save
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end






end
