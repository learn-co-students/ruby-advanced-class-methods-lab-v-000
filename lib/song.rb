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
    self.all.find{|w| name == w.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == true ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|w| w.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    split_data = filename.split(/\s-\s|\./)
    song.artist_name = split_data[0]
    song.name = split_data[1]
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
