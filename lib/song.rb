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

  #this class constructor initializes a song and saves it to the @@all class variable either literally or through the class method Song.all.  This method should return the song instance that was initialized and saved.
  def self.create
    song = Song.new
    @@all << song
    song
  end

  #A class constructor that takes in the string name of a song and returns a song instance with that name set as its name property

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    #returns the song instance with that name set as its name property
    song
  end

  #class constructor take in the string name of a song and returns a song instance with that name set as its name property and the song being saved into the @@all class variable
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  #Build a class finder Song.find_by_name that accepts the string name of a song and returns the matching instance of the song with that name.
  def self.find_by_name(name)
    #binding.pry
    @@all.detect {|song| song.name == name}
    #return the song whose name matches what was passed through
  end

  #In order to prevent duplicate songs being created that actually represent the same song (based on the song name), we're going to build a Song.find_or_create_by_name class method. This method will accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance.

  def self.find_or_create_by_name(name)
    target_song = find_by_name(name)

    if !target_song
      create_by_name(name)
    else
      target_song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    file = filename.chomp(".mp3")
    #binding.pry
    file_array = file.split(" - ")
    song.artist_name = file_array[0]
    song.name = file_array[1]
    #binding.pry
    #return the song object with the right song title and artist from filename
    song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = Song.create
    file = filename.chomp(".mp3")
    #binding.pry
    file_array = file.split(" - ")
    song.artist_name = file_array[0]
    song.name = file_array[1]
    #binding.pry
    #return the song object with the right song title and artist from filename
    song
    #binding.pry
  end

  def self.destroy_all
    @@all.clear
  end

end
