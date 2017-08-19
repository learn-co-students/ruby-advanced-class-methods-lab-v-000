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

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    alphabetized_songs = self.all.sort_by{|song| song.name}
    alphabetized_songs
  end

  def self.new_from_filename(filename)
    artist_and_song = filename.split(/[-.]/).slice(0,2).map{|entry| entry.strip}
    artist = artist_and_song[0]
    song_title = artist_and_song[1]

    song = self.new
    song.name = song_title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist_and_song = filename.split(/[-.]/).slice(0,2).map{|entry| entry.strip}
    artist = artist_and_song[0]
    song_title = artist_and_song[1]

    song = self.new
    song.name = song_title
    song.artist_name = artist
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
