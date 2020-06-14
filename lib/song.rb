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
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_songs = self.new_by_name(name)
    new_songs.save
    new_songs
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      songs = self.create_by_name(name)
      songs
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name }
    sorted
  end

  def self.new_from_filename(name)
    file = name.split(" - ")
    artist_name = file[0]
    data = file[1].split(".")
    song_name = data[0]
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end
  
  def self.create_from_filename(name)
    new_songs = self.new_from_filename(name)
    new_songs.save
    new_songs
  end
  
  def self.destroy_all
    self.all.clear
  end
end
