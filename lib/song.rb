require 'pry'
class Song
  attr_accessor :name, :artist_name, :song 
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
    @song = self.new 
    @song.name = name
    @song
  end
 
 
  def self.create_by_name(name)
    @song = self.create  
    @song.name = name
    @song
  end
  
  
  def self.find_by_name(name)
    self.all.find do |song| 
      song.name == name 
    end
  end
    
  
  def self.find_or_create_by_name(name) 
       self.find_by_name(name) || self.create_by_name(name)
  end
 
  def self.alphabetical 
    sorted = self.all.sort_by{|song| song.name}  
    sorted
  end 
  
  
  def self.new_from_filename(filename)
      song = self.new
    song_array = filename.split(" "," - ",".") 
    song_artist_name = song_array[0]
    song_name = song_array [1] 
    song_file_format = song_array[2]
    song.artist_name = artist_name
  end
  
  
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.artist_name = artist_name
     
    song.name = song_name
   
    song
      #binding.pry
  end
  
  
  
  def self.destroy_all 
    self.all.clear 
  end
end 
