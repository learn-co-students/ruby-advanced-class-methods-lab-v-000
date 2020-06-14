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
  	song = self.new
  	song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	@@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
  	song = self.new
  	parsed_filename = filename.chomp(".mp3").split(" - ")
  	song.artist_name = parsed_filename[0]
  	song.name = parsed_filename[1]
  	song
  end

  def self.create_from_filename(filename)
  	song = self.new
  	parsed_filename = filename.chomp(".mp3").split(" - ")
  	song.artist_name = parsed_filename[0]
  	song.name = parsed_filename[1]
  	song.save
  	song
  end



  def self.destroy_all
  	self.all.clear
  end



end
