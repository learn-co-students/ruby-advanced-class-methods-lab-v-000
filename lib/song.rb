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
    new_song = self.new
    @@all << new_song
    new_song
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
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
      name = info[1].chomp(".mp3")
      artist_name = info[0]

    song = self.new
      song.name = name
      song.artist_name = artist_name
    song
  end

  def self.create_from_filename(mp3)
    info = mp3.split(" - ")
      name = info[1].chomp(".mp3")
      artist_name = info[0]

    song = self.create
      song.name = name
      song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
