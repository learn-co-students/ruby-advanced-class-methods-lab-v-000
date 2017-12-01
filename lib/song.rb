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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)

    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical #why doesnt this method take in an argument? is it because we are not adding anything to the list but are just sorting what we have?
    self.all.sort_by{|s| s.name}

  end

  def self.new_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    song_name = part[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    song_name = part[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    song = self.all
    song.clear
  end




end
