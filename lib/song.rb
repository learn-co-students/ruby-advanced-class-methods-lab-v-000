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
#class constructor
# initializes a song and saves it to the @@all class variable either literally or through the class method Song.all
  def self.create
    #make a new instance
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
      #make a new instance
      song = self.new       #new instance
      song.name= name          # call a method on it that will allow us to name it as the song_name
      song                            #access to an instance of the Song class
    end

#class constructor
#class mehtod takes in the string name of a song
#returns a song instance with that name set as its name property
  def self.create_by_name(name) #takes in a string
  #make a new instance
  song = self.new_by_name(name)
  song.save
  song
end

  def


end
