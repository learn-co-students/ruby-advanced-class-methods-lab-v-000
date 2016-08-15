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

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end  
 
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    @@all.detect {|song| song.name == name}
      song = self.new
      song.name = name
      song.save
      song 
  end

  def self.alphabetical
      all.uniq.sort_by {|songs| songs.name}
  end  

  def self.new_from_filename(filename)
    artist_song = filename.chomp('.mp3') 
    artist_song = artist_song.split(" - ")
    artist_name = artist_song[0]
    name = artist_song[1] 
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    artist_song = filename.chomp('.mp3') 
    artist_song = artist_song.split(" - ")
    artist_name = artist_song[0]
    name = artist_song[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
  end  

  def self.destroy_all
    @@all.clear
  end  
end


