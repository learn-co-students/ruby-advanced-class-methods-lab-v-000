require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @song = Song.new
    @song.save
    @song
  end
  
  def self.new_by_name(str)
    @song = self.new
    @song.name = str
    @song
  end
  
  def self.create_by_name(str)
    @song = self.new
    @song.name = str
    @@all << @song
    @song
  end
  
  def self.find_by_name(str)
    @@all.find do |song|
      song.name == str
    end
  end
  
  def self.find_or_create_by_name(str)
    if self.find_by_name(str) != NIL
      self.find_by_name(str)
    else
      self.create_by_name(str)
    end
  end
  
  def self.alphabetical
    
    @@all.sort_by do |arg|
      arg.name
      # binding.pry 
    end
  end
  
  def self.new_from_filename(filename)
    parsedSong = filename.split(/\s[-]\s|.mp3/)
    @song = self.new
    @song.name = parsedSong[1]
    @song.artist_name = parsedSong[0]
    @song
  end
  
  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  
end
