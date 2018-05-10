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
    @@all.detect{|song|song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)  
  end 
  
  def self.alphabetical
    @@all.sort_by{|song|song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    artist_and_song = filename.split(" - ")
    song.artist_name = artist_and_song[0]
    song.name = artist_and_song[1].gsub(".mp3", "")
    song 
  end 
  
  def self.create_from_filename(filename)
    song = self.new 
    artist_and_song = filename.split(" - ")
    song.artist_name = artist_and_song[0]
    song.name = artist_and_song[1].gsub(".mp3", "")
    song.save 
    song 
  end
  
  def self.destroy_all
    @@all = []
  end 
    
end
