require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def save
    self.class.all << self
  end
 
  def self.create 

  new_song = self.new(name)
  @@all << new_song.save
  new_song
  end    #is this actually correct???

  def self.new_by_name(name)
    name = self.new(name)
    name
  end
  
  def self.create_by_name(title)
    song = self.new(title)
    song.save
    @@all << song
    song
  end
    
  def self.find_by_name(title)
    @@all.find do |s|
      if s.name == title 
        title 
      else
        false
      end
    end 
  end
  
  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end
    
  
  def self.alphabetical
    # binding.pry
    @@all.sort_by do |song| 
      song.name 
      # binding.pry
    end.uniq 
  end
  
   def self.new_from_filename(filename)
    
    song = self.new(name)
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
    
   end 
  
  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end
  
    
  
  def self.destroy_all
    @@all.clear
  end
    
end




 # def self.new_from_filename(name, artist_name)
  #   song = self.new
  #   song.name 
  #   song.artist_name 
  #   "#{song.name}" + " - " + "#{song.artist_name}"
    