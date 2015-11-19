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

  def self.create()
    song = Song.new
    self.all << song
    self.all.last
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    self.all.last
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) if self.find_by_name(name) == nil
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort{|x,y| x.name <=> y.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1][0..data[1].length-5]
    artist = data[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    self.all.last
  end
end
