require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

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
   
    # returns the new song
    song
  end 
#    - new_by_name
#    - create_by_name 
#    - find_by_name 
#    - find_or_create_by_name 
#    - alphabetical 
#    - new_from_filename
#    - create_from_filename
#    - destroy_all 

end
