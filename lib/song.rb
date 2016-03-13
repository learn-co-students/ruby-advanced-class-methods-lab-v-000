 
class Song
 
 #Setter ang getter methods for instance methods: name and artist_name
  attr_accessor :name, :artist_name

  #class variable
  @@all = []
  
  #This is a class method with a class variable.
  def self.all
    @@all
  end
   
   #This is an instance method with class method called in it.
   #The "self" on the left represents "class" while the "self" on the right represents an instance of "class" being pushed into the class variable (@@all).
  def save
    self.class.all << self
  end
  
  def self.create
    #create or instantiate an instance of Song.
    song = Song.new
    #saves the new instance of Song in the class variable @@all
    song.save
    #returns the new instance of Song class.
    song
  end
  def self.new_by_name(name)
    song = Song.new
    #calling #name on an instance of Song
   song.name = name
   #returning the new created song
    song
  end

  def self.create_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
    #detect method iterates over the class variable @@all and returns the first song that matches song name passed in as an argument.
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
    def self.new_from_filename(filename)
      song = Song.new
      ##split converts the string argument into an array using "-" delimiter i.e the separation begins before and after "-" as such all the words before "-" will be one data and everyword after "-" will be one also while "-" is eliminated from the returned array.
      file = filename.split(" - ")
      #After calling #split on "filename" the returned array is given as value to variable "file"
      #while calling #artist_name on song, a data with an array index number "0" from variable "file", is being awarded as its (artist_name) value.
      song.artist_name = file[0]
      #while calling #name on song a data with an array index number "1" from variable "file", is being awarded as its (name) value. Also the ".mp3" is being removed from the data using #sub, that requires two arguments, the first argument is to be replaced by the second argument.
      song.name = file[1].sub(".mp3","")
      song
    end

    def self.create_from_filename(filename)
      self.new_from_filename(filename).save
    end

    def self.destroy_all
      self.all.clear
    end

end
