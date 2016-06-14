require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #class constructor
    @@all
  end

  def save
    self.class.all << self #self.class = the entire class
    #instance that the method is called on
      # Within #initialize, an instance method, self will refer to an instance,
      #  an individual person, not the entire class, so we can't simply say self.
      #  all within an instance method. Instead, we go from the instance, self,
      #  to the class via self.class, returning Song, and then evoke the Song.all method.
  end

  def self.create  #class constructor initializes a song and saves it to the @@all class variable
    song = self.new #create a new instance of a song
    #self would refer to the song instance stored in that song
    song.save
    song #return the song
  end

  def self.new_by_name(name)#class scope #new methods aren't being saved
    song = self.create #use the previous method to build ontop this method
    song.name =name #create a name method of the class instance song
    song
  end

  def self.create_by_name(name) #saves a song with a name property
    self.new_by_name(name) #use teh previous method to build ontop this method
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name} #check for the matching value by iterating through the @@all array
  end

  def self.find_or_create_by_name(name) #finds or creates a song by name maintaining uniqueness of objects by name property
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename_input)
    song = self.create
   	file_arr = filename_input.to_s.split(/[-.]/)
 	  song.artist_name = file_arr[0].chop #remove space from the front of the character
    song.name = file_arr[1].gsub(/^\s/, "") #remove space from the end of the character
    song
  end

  def self.create_from_filename(filename_input)
    song = self.new_from_filename(filename_input)
    song.save
  end

  def self.destroy_all
    song = self.all.clear #clears all the song instances from the @@all array
  end
end
