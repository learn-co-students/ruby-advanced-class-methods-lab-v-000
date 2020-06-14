

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create #create a a song at startup and save it to the class variable @@all
    song = self.new #this creates an instance of a song through creating a new instance of the class
    self.all << song  # take the instance and add to class array
    song #return the instance
  end

#Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(name) #create a a song at startup and save it to the class variable @@all && allocates a name title to name attribute
    song = self.create # re use the self.create  to create the new instance
    song.name = name  # the attr_accessor create the name attribute, this takes the new instance and sets the name attribute to the name that is given in the method
    song #return the instance
  end
  def self.create_by_name(name)  #create a song attribute with a given name, add that to the class array
    song = self.new_by_name(name)
    song.name = name
    song
  end
  def self.find_by_name(search)  #this will search the class array for the exact name of a song to see if it is within the class array
      self.all.detect {|x| x.name == search}
      #above code accesses the class, then the class variable, then uses, calls the name attribute of the instance and see if it is equal to what you are looking for
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
    #the code below is alt method using if statement
      #if self.find_by_name(name) != true
      #  self.create_by_name(name)
      #end
  end

  def self.alphabetical
      self.all.sort_by {|element| element.name}
      #below is 1 way to code this example, this takes the class array and compares each other by name
      #self.all.sort {|a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
     data = filename.split(" - ")
     artist = data[0]
     name = data[1].split(".")
     song = self.find_or_create_by_name(name[0])
     song.name = name[0]
     song.artist_name = artist
     song
   end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    #one way of doing this code is below but it is not needed because the self.new_from_filename already saves the song in theclass variable
    #self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear

  end

end
