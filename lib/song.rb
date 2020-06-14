
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
    song.name = song
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
 #binding.pry
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 
  end
  
  def self.destroy_all
    self.all.clear
  end
    
  def self.alphabetical
   # binding.pry
    self.all.sort_by{|song| song.name}
  end
      
  def self.new_from_filename(file_name)
    #binding.pry
    new_file = file_name.split(" - ")
    name = new_file[1].chomp(".mp3")
    artist = new_file[0]
    song = self.create
    song.artist_name = artist
    song.name = name
    song
  end
    
  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
    
  end

end
