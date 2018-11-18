require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@songs = []
  @@artists = []
  
  def initialize(song_name = nil)
    @name = song_name
  end

  def self.create
    song = Song.new
    song.save
    song
  end 
  
  def self.new_by_name(song_name)
    song = Song.new(song_name)
    song
  end
  
  def self.create_by_name(song_name)
    song = Song.new(song_name)
    song.save
    song
  end 
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    song_name = file_array[1].chomp(".mp3") 
    artist = file_array[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist 
    song.save
    song
  end 
  
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end 

  def self.destroy_all
    @@all.clear
  end 
end
