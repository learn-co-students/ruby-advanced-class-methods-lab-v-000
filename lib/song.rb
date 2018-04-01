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
  
  def self.new_by_name(song_name)
   song = self.new 
   song.name = song_name
   song
  end 
  
  def self.create_by_name(song_name) 
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect {|find| find.name == song_name }
  end 
  
  def self.find_or_create_by_name(song_name) 
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical 
  @@all.sort_by{|word| word.name}
  
end

def self.new_from_filename(filename)
  splitter = filename.split(" - ")
  artist_name = splitter[0]
  song_name = splitter[1].gsub(".mp3","")
  song = self.new 
  song.name = song_name
  song.artist_name = artist_name
  song 
end 

def self.create_from_filename(filename)
  splitter = filename.split(" - ")
  artist_name = splitter[0]
  song_name = splitter[1].gsub(".mp3","")
  song = self.create 
  song.name = song_name
  song.artist_name = artist_name
  song 
end 

def self.destroy_all 
  @@all.clear
end 


end
