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
    #that takes in the string name of a song
    #returns a song instance with that name set as its name property
    #the song being saved into the @@all class variable
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # binding.pry
    self.all.sort_by! {|song| song.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end


end
