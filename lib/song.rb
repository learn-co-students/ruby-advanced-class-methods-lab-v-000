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
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      return self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    new_filename = file_name.chomp(".mp3")
    song_name = new_filename.split(" - ")
    
    song = Song.new
    song.name = song_name[1]
    song.artist_name = song_name[0]
    song
  end
    
  def self.create_from_filename(file_name)
    new_filename = file_name.chomp(".mp3")
    song_name = new_filename.split(" - ")
    
    song = Song.create
    song.name = song_name[1]
    song.artist_name = song_name[0]
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
