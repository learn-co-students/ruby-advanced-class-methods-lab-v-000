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
    song = self.new
    song.name = name

    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    
    if !self.all.include?(song)
      @@all << song
    end
    
    song
  end
  
  def self.find_by_name(name)
    self.all.find{ | song | song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    
    if !song
      song = self.create_by_name(name)
    end

    song
  end
  
  def self.alphabetical
    self.all.sort_by { | song | song.name }
  end
  
  def self.new_from_filename(filename)
  	parts = filename.split(' - ')
  	song = self.new_by_name(parts[1].split('.')[0])
  	song.artist_name = parts[0]
  	
  	song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    
    if !self.all.include?(song)
      @@all << song
    end
    
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
