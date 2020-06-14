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
    song.name == song_name
    end
  end
    
  def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by { |change| change.name }
  end
  
  def self.new_from_filename(mp3_song)
  song = self.new
  song_wo_mp3 = ""
  x = mp3_song.split(" - ")
  y = x[1].gsub(".mp3", "")
  song.artist_name = x[0]
  song_wo_mp3 << y
  song.name = song_wo_mp3
  song
  end
  
  def self.create_from_filename(mp3_song)
  song = self.create
  song_wo_mp3 = ""
  x = mp3_song.split(" - ")
  y = x[1].gsub(".mp3", "")
  song.artist_name = x[0]
  song_wo_mp3 << y
  song.name = song_wo_mp3
  song
  end
  
  def self.destroy_all
    self.all.clear
  end
end

