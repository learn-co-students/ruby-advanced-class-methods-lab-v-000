require 'pry'
#@@all stores all of the instances of this Song class that you create. @@all is a class variable.
#set this class variable to an empty array to store all of those instances

class Song
  attr_accessor :name, :artist_name #making these variables avail to my methods below
  @@all = []

  def self.all
    #this method stores all instances of this class inside of the class variable, the @@all array
    @@all
  end

  def save
    #instnace method.
    #save each instance and push this into the class.all
    self.class.all << self
  end

  def self.create
    #class method, saves all of the instances
    song = self.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
    end

  def self.find_or_create_by_name(name)
  #pass in an argument of the song name
  #look into the array @@all to see if it is already included or not - call self.
  #just using the logic from the two previous methods. just utilze those other two methods you already set up!!!
#    if self.find_by_name(name)
     #self.find_by_name(name)
       #if self (the class array) find_by_name = the name you pass into it exits  then return that name!
      #if that name does not exist (i.e. you do NOT find it) then you need to create it!
#    else self.create_by_name(name) #you must call self. to let the program know WHO/WHAT you are calling this method on.
    #  return self.create_by_name(name)
  self.find_by_name(name) ?   self.find_by_name(name) : create_by_name(name)
    end


  def self.alphabetical
#do NOT need to pass an argument in here bc we are looking at the @@all array that has already had values inside of it (maybe) depending on the previous methods in this class?
   #@@all.sort { |a, b| a.name <=> b.name }
   #this is calling sort on the @@all array and saying look at the values in position a and b and compare (<=>) if A is before B, move to the front of the array, etc. (Alphabetize)
   @@all.sort_by { |song| song.name }
  end


  def self.new_from_filename(filename)
      #take in the argument of filename (a string with song name artist and mp3 at end. chomp off mps and split name and artist)
      new_from_filename = filename.chomp(".mp3").split(" - ")
      # this will return a new variale (new_from_filename) the has the string with the mp3 end chomped off and it is split btw the - divider
      song = Song.new #create new instance of the song class
      song.name = new_from_filename[1] #song name comes from 2nd position
      song.artist_name = new_from_filename[0]
      song
    end

def self.create_from_filename(filename)
  new_from_filename = filename.chomp(".mp3").split(" - ")
  song = Song.new
  song.name = new_from_filename[1]
  song.artist_name = new_from_filename[0]
  song.save
  song
end


  def self.destroy_all
    self.all.clear
  end

end
