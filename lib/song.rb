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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = self.new_by_name(data[1][0...-4])
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    song = self.create_by_name(data[1][0...-4])
    song.artist_name = data[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end


blank_space = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
=begin
hello = Song.create_by_name("Hello")
meh = Song.create_by_name("Meh")
Song.find_by_name("Hello")
=end
