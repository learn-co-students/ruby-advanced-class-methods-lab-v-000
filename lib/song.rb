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

  def self.new_by_name(title)
  	song = self.new
  	song.name = title
  	song
  end

  def self.create_by_name(title)
  	song = self.new
  	song.name = title
  	@@all << song
  	song
  end

  def self.find_by_name(title)
  	self.all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
  	self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
  	@@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	data = filename.split(" - ")
  	#binding.pry
  	new_title = data[1].chomp(".mp3")
  	song = self.new_by_name(new_title)
  	artist = data[0]
  	song.artist_name = artist
  	song
  end

  def self.create_from_filename(filename)
  	self.new_from_filename(filename).save
  end

  def self.destroy_all
  	self.all.clear 
  end
end
