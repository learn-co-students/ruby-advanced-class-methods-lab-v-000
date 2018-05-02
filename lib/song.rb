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
    mysong = self.new
    @@all << mysong
    mysong
  end 
  
  def self.new_by_name(song_name)
    mysong = self.new 
    mysong.name = song_name
    mysong.save
    mysong
  end 
  
  def self.create_by_name(song_name)
    mysong = self.new
    mysong.name = song_name
    mysong.save
    #binding.pry
    mysong
  end 
  
  def self.find_by_name(song_name)
    songis = []
    
    @@all.each{ |song_names|
      if song_names.name == song_name
        songis = song_names
      end 
    }
    songis
  end 
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) 
       self.find_by_name(song_name)
    else 
       self.new_by_name(song_name) 
       #binding.pry 
    end 
  end 
  
  def self.alphabetical
    
    sort_arr = {} 
    sort_arr = @@all.sort_by{|song_obj| song_obj.name}
    sort_arr
  end 
  
  def self.new_from_filename(filename) 
    arr1 = []
    arr2 = []
    
    arr1 = filename.split(" - ")
    artist_name = arr1[0]
    
    arr2 = arr1[1].split(".")
    song_name = arr2[0]
   
    mysong = self.new
    mysong.name = song_name
    mysong.artist_name = artist_name
    
    @@all << mysong
    mysong
  end 
  
  def self.create_from_filename(filename)
    arr1 = []
    arr2 = []
    
    arr1 = filename.split(" - ")
    artist_name = arr1[0]
    
    arr2 = arr1[1].split(".")
    song_name = arr2[0]
    
    puts artist_name
    puts song_name
    
    song_new = self.new 
    song_new.name = song_name
    song_new.artist_name = artist_name
    song_new.save
    song_new
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
end
