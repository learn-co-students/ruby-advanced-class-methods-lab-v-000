require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize 
    @@all << self 
    
  end 
  
  def self.name
    @name
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
 
  def self.new_by_name
    # instantiate with name property
   
    song = self.new
    song.name(" ")
  end
#    - create_by_name 
#    - find_by_name 
#    - find_or_create_by_name 
#    - alphabetical 
#    - new_from_filename
#    - create_from_filename
#    - destroy_all 

end
