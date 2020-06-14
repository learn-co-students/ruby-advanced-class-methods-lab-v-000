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
  	@@all << song
  	song
  end

  def self.new_by_name(name)
  	named = self.new
  	named.name = name
  	named
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	@@all << song
  	song
  end

  def self.find_by_name(name)
  	@@all.detect{|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == nil
  		self.create_by_name(name)
  	else self.find_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by! {|a| a.name}
  end

  def self.new_from_filename(filename)
  	songname = filename.split(" - ") 
  	nomp3 = songname[1].split(".")

  	artist_name = songname[0]
  	name = nomp3[0]

  	song = self.new
  	song.name = name
  	song.artist_name = artist_name
  	song
  end

  def self.create_from_filename(filename)
  	song = self.new_from_filename(filename)
  	@@all << song
  end

  def self.destroy_all
  	@@all = []
  end
end
