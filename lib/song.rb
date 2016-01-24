require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def name=(name)
    #@name = name
  #end

  #def name
    #@name
  #end

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
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #this means that I am calling the first method, .find_by_name(name), and if that doesn't return true, it will run the second method, .create_by_name(name) and vice versa

    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(file)
    info = file.split(" - ")
  
    artist_name = info[0]
    name = info[1].split(".")[0]

    song = Song.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
