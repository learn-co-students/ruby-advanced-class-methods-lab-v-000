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
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song #will return this array
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(song_data)
    data_parts = song_data.split(" - ")
    song = self.new
    song.name = data_parts.last[0...data_parts.last.length-4]
    song.artist_name = data_parts.first

    song
  end

  def self.create_from_filename(song_data)
    song = self.create
    data_parts = song_data.split(" - ")
    song.name = data_parts.last[0...data_parts.last.length-4]
    song.artist_name = data_parts.first
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
