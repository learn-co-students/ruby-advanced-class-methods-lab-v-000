
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
    song.name = name
    self.all << song
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
    self.all << song
    song
  end
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  
  def self.alphabetical 
      self.all.sort_by do |song|
      song.name
    end
  end 
  
  def self.new_from_filename(mp3)
     rows =  mp3.split(" - ")
     song = self.new
     song.name = rows[1].gsub(".mp3","")
     song.artist_name = rows[0]
     song
  end
  
  def self.create_from_filename(file)
    rows =  file.split(" - ")
    song = self.new
    song.name = rows[1].gsub(".mp3","")
    song.artist_name = rows[0]
    self.all << song
  end

    def self.destroy_all
      self.all.clear()
    end
  
end
