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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
	self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name) 
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}.uniq
  end

  def self.new_from_filename(filename)
  	split_file = filename.split(" - ")
    song = self.new
    song.artist_name = split_file[0]
    song.name = split_file[1].split(".mp3")[0]
    song
  end

   def self.create_from_filename(filename)
  	split_file = filename.split(" - ")
    song = self.new
    song.artist_name = split_file[0]
    song.name = split_file[1].split(".mp3")[0]
    song.save
  end

  def self.destroy_all
  	@@all.clear
  end

end

