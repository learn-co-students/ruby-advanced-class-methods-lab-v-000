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
    song = Song.new
    song.save
    return song
  end
  
  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    return song
  end
  
  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    return song
  end
  
  def self.find_by_name(song_name)
    @@all.detect {|i| i.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end
  
  def self.new_from_filename(filename)
    i = filename.split(" - ")
    artist_name = i[0]
    song_name = i[1].gsub(".mp3", "")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    return song 
  end
  
  def self.create_from_filename(filename)
    i = filename.split(" - ")
    artist_name = i[0]
        # song_name = i[1].reaplce(".mp3", "")]
    song_name = i[1].gsub(".mp3", "")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    self.find_or_create_by_name(song_name)
    return song 
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
