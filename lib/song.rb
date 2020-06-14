
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
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(name)
    song = Song.new
    a = name.split(".").shift.split(" - ")
    song.name = a[1]
    song.artist_name = a[0]
    song
  end

  def self.create_from_filename(name)
    song = Song.create
    a = name.split(".").shift.split(" - ")
    song.name = a[1]
    song.artist_name = a[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
