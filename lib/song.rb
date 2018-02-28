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
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name 
    #song.save
    song
  end
  
  def self.find_by_name(name)
     @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
        self.find_by_name(name)
      else 
      self.create_by_name(name)
    end
  end
  #binding.pry
  def self.alphabetical 
   self.all.sort_by(&:name) 
  end 
  
  def self.new_from_filename(file)
   song = self.new
   new_file = file.chomp(".mp3").split(" - ")
   song.artist_name = new_file[0] 
   song.name = new_file[1] 
   song
  end
  
  def self.create_from_filename(file)
  song = self.create
   new_file = file.chomp(".mp3").split(" - ")
   song.artist_name = new_file[0] 
   song.name = new_file[1] 
   song
  end
  
  def self.destroy_all 
    @@all.clear
  end 
  
end
