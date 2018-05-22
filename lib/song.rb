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
    s = self.new
    s.save
    s
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
    self.all.detect {|song| song.name == song_name}
  end  
  
  
  def self.find_or_create_by_name(check_song_name)
    self.find_by_name(check_song_name) || self.create_by_name(check_song_name)
  end   
  
  def self.alphabetical 
    @@all.sort_by! {|song| song.name}
  end  
  
  def self.new_from_filename(file_name)
    s = self.new 
    s.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
    s.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s 
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end   
  #binding.pry 
  
  def self.destroy_all 
    @@all.clear 
  end   
    
end
