require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all 
  end
  
  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end 
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end 

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end 

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name).class == Song
     find_by_name(name)
    else create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song| song.name
    end
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_from_filename(mp3_string)
    new_song = self.new
    mp3_split = mp3_string.split(" - ")
    new_song.artist_name = mp3_string.split(" - ")[0]
    new_song.name = mp3_string.split(" - ")[1].split(".")[0]
    new_song
  end
  
  def self.create_from_filename(mp3_string)
    new_song = self.new
    mp3_split = mp3_string.split(" - ")
    new_song.artist_name = mp3_string.split(" - ")[0]
    new_song.name = mp3_string.split(" - ")[1].split(".")[0]
    self.all << new_song
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end

end