require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    sorted = []
    sorted = self.all.sort_by { |song| song.name }
    sorted
  end
  
  def self.new_from_filename(filename)
    # parses data from file name into an array of song_data
    # required format: Artist Name - Song Name.mp3
    song_data = filename.split(".")[0].split("-").map(&:strip)
    
    # creates new instance of Song class and assigns song_data to the Song
    new_song = self.new
    new_song.artist_name = song_data[0]
    new_song.name = song_data[1]
    
    # returns the new song
    new_song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
