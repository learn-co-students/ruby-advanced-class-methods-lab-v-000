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
    song.name = name
    @@all << song
    song
  end 
  
  def self.new_by_name(song)
    name = song
    song = self.new
    song.name = name
    @@all << song
    song
  end 
  
  def self.create_by_name(song)
    name = song 
    song = self.new
    song.name = name 
    @@all << song 
    song
  end 
  
  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else 
      self.create_by_name(song_name)
    end 
  end 
  
  def self.alphabetical
    #binding.pry
    @@all.sort_by!{|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    song_name = new_song[1].gsub(".mp3", "")
    artist_name = new_song[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  
  def self.create_from_filename(filename)
    new_song = filename.split(" - ")
    song_name = new_song[1].gsub(".mp3", "")
    artist_name = new_song[0]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
  end
  
  def self.destroy_all
    self.all.clear
  end 
end
