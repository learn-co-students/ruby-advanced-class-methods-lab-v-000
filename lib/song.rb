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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song|song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.each.sort_by{|song|song.name}
  end

  def self.new_from_filename(song_name)
    song = self.new
    data = song_name.split(" - ")
    song.artist_name = data[0]
    song_filename = data[1]
    song_create = song_filename.split(".")
    song.name = song_create[0]
    song
  end

  def self.create_from_filename(song_name)
    song = self.new
    data = song_name.split(" - ")
    song.artist_name = data[0]
    song_filename = data[1]
    song_create = song_filename.split(".")
    song.name = song_create[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
