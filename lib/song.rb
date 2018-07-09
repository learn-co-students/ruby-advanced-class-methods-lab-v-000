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
     @@all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end 
  
  def self.new_from_filename(filename)
    song=filename.gsub(".mp3", "")
    song_name=song.split(" - ")
    song=self.new
    song.name=song_name[1]
    #binding.pry
    song.artist_name=song_name[0]
    song
  end 
  
  def self.create_from_filename(filename)
    song=self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
