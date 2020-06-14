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
    @@all << song
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
    @@all << song
    song
  end
  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if @@all.detect{|name| self.name == name} == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(song_name)
 
    new_filename = song_name.chomp('.mp3')
    newer_filename = new_filename.split(" - ")
    artist_name = newer_filename[0]
    new_name = newer_filename[1]
    
    song = self.new
    song.artist_name = artist_name
    song.name = new_name
    song
  end
  
  def self.create_from_filename(song_name)
    new_filename = song_name.chomp('.mp3')
    newer_filename = new_filename.split(" - ")
    artist_name = newer_filename[0]
    new_name = newer_filename[1]
   
    song = self.new
    song.artist_name = artist_name
    song.name = new_name
    @@all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
end

