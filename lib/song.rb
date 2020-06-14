require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def save
    self.class.all << self
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(mp3)
    song = self.new
    song.name = mp3.split(/\s-\s|.mp3/)[1]
    song.artist_name = mp3.split(/\s-\s|.mp3/)[0]
    song.save
    song
  end
  
  def self.create_from_filename(mp3)
    song = self.new
    song.name = mp3.split(/\s-\s|.mp3/)[1]
    song.artist_name = mp3.split(/\s-\s|.mp3/)[0]
    song.save
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end