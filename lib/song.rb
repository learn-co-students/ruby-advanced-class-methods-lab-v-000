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
    song = self.new_by_name(song_name)
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end
  
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end  
  
  # def self.find_or_create_by_name(song_name)
  #   self.find_by_name(song_name) || self.create_by_name(song_name)
  # end
  
  def self.alphabetical 
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    clean_song = filename.split(".mp3").first
    song = new_by_name(clean_song.split(" - ").last)
    song.artist_name = clean_song.split(" - ").first
    song
  end  
  
  def self.create_from_filename(filename)
    clean_song = filename.split(".mp3").first
    song = create_by_name(clean_song.split(" - ").last)
    song.artist_name = clean_song.split(" - ").first
    #parts = filename.split(" - ")
    #artist_name = parts[0]
    #song_name = parts[1].gsub(".mp3", "")
  end  
  
  def self.destroy_all
    @@all.clear
  end
  
end
