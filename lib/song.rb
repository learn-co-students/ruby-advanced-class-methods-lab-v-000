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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
       self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    res = self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(mp3Name)
    mp3Name.slice! ".mp3"
    newArray = mp3Name.split('-')
    song = self.new
    song.name = newArray[1].strip!
    song.artist_name = newArray[0].strip!
    song
  end
  
  def self.create_from_filename(mp3Name)
    mp3Name.slice! ".mp3"
    newArray = mp3Name.split('-')
    song = self.new
    song.name = newArray[1].strip!
    song.artist_name = newArray[0].strip!
    @@all << song
    song    
  end
  
  def self.destroy_all
    @@all.clear
  end
    
  def self.new_From_filename(mp3Name)
    mp3name.split("-").slice! "mp3"
    
  end
end
