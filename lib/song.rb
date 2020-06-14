#require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  #Class Constructor
  def self.create
    song = self.new
    song.save
    song
  end  
  
  #Class Constructor
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  #Class Constructor
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  #Class Finder
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      return self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_file)
    split = song_file.split(" - ")
    artist_name = split[0]
    song_name = File.basename(split[1], ".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(song_file)
    split = song_file.split(" - ")
    artist_name = split[0]
    song_name = File.basename(split[1], ".mp3")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end