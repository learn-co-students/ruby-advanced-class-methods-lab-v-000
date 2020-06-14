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
    song.save
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
    @@all.detect do |song|
      song_name == song.name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(full_song)
    
  full_song_array = full_song.gsub!(".mp3","").split(" - ")
  song = self.new
  song.name = full_song_array[1]
  song.artist_name = full_song_array[0]
  song
  
  end
  
  def self.create_from_filename(full_song)
    full_song_array = full_song.gsub!(".mp3","").split(" - ")
  song = self.create
  song.name = full_song_array[1]
  song.artist_name = full_song_array[0]
  song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
