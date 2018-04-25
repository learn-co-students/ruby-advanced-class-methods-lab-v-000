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
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|songs| songs.name }
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song = self.new
    song.name = filename[1].gsub(".mp3", "")
    song.artist_name = filename[0].chomp
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    song = self.create
    song.name = filename[1].gsub(".mp3", "")
    song.artist_name = filename[0].chomp
  end

  def self.destroy_all
    self.all.clear
  end

end
