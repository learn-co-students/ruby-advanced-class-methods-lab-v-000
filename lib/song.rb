class Song #object class set to constant
  attr_accessor :name, :artist_name #each instantiation of song object creates a song name and artist name

  @@all = [] #class variable set to equal an empty array

  def self.all #each instance of object self has a method all equal to the array above
    @@all
  end

  def save #method .save shovels each instance of self onto the array of all objects of a song class
    self.class.all << self
  end

  def self.create #method .create creates a new instance of an object and uses the method .save to save and return the song name
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name) #method new_by_name takes in an argument of song name, sets it equal to a new instance of object, sets the name (created in attr_accessor) to equal argument variable
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name) #takes in argument of song_name
    song = self.new #creates a new instance of object
    song.name = song_name #sets name created in attr_accessor to equal variable
    song.save #uses save method to save the instance of the song to the all array
    song #returns song
  end

  def self.find_by_name(song_name) #takes in argument of song_name
    self.all.detect {|song| song.name == song_name} #searches through each self, enumerates over each object and returns true if the song name is equal to the argument variable provided
  end


  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil  #(need existing song = return song; else = create)
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song_name| song_name.name }
  end

  def self.new_from_filename(mp3_file)
    song = self.new
    song.name = mp3_file.split(" - ")[1].split(".")[0]
    song.artist_name = mp3_file.split(" - ")[0]
    song
  end

  def self.create_from_filename(mp3_file)
    song  = self.new #instantiate new instance of object called new_song to equal new song name
    song.name = mp3_file.split(" - ")[1].split(".")[0] #splits based on regex for first [0] and second [1] items in array created by split and sets to equal new_song.name   #REGEX:any single charachter except upper/lowercase a-z with any whitespace character OR with any two whitespace characters
    song.artist_name = mp3_file.split(" - ")[0]
    @@all << song
  end

  def self.destroy_all
  @@all.clear
  end

end
