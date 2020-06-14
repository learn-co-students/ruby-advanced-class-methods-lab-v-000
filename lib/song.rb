require 'pry'

class Song
  attr_accessor :name, :artist_name, :filename
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
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.gsub(".", " - ").split(" - ")[0]
    song.name = filename.gsub(".", " - ").split(" - ")[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    song.artist_name = filename.gsub(".", " - ").split(" - ")[0]
    song.name = filename.gsub(".", " - ").split(" - ")[1]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
