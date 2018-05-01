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
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end
  
  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(song)
    @@all.detect {|s| return s if s.name == song}
  end
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else  
      self.create_by_name(song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  
  
  def self.new_from_filename(filename)
    array = filename.chomp(".mp3").split(" - ")
    a = array[0]
    n = array[1]
    song = self.new
    song.artist_name = a
    song.name = n
    song
  end
  
  
  
  def self.create_from_filename(filename)
    array = filename.chomp(".mp3").split(" - ")
    artist = array[0]
    title = array[1]
    song = self.new
    song.name = title
    song.artist_name = artist
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
