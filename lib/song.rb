require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize 
     
    @@all << self 
    #@name = name
  end 
  
  def self.all
    @@all
  end

  def self.save
    self.class.all << self
  end
  
  # create the following class methods - include the "self" keyword in the method name:
#    - create 
  def self.create 
    # Song.new - instantiate
    song = self.new
    # save the new song
    song
    # returns the new song 
  end 
#    - new_by_name 
  def self.new_by_name(name)
    # instantiate with name property
   song = self.new 
   song.name = name
   song   
  end
#    - create_by_name 
  def self.create_by_name(name) 
    # instantiate song 
    song = self.new
    # saves song with name property
    song.name = name 
    @@all << song
    # return song
    song
  end 
#    - find_by_name 
  def self.find_by_name(name)
    @@all.find {|song_name| song_name.name == name}  
  end 
#    - find_or_create_by_name 
  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      song = self.new 
      song.name = name 
    else self.find_by_name(name)
    end
    self.create_by_name(name)
    name
    
 
    end 
  end 
#    - alphabetical 
#    - new_from_filename
#    - create_from_filename
#    - destroy_all 

end
