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

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end #method

  def self.new_by_name(new_song_by_name)
    #instantiates a new object, gives the object a name, and returns the object.
    song = Song.new
    song.name = new_song_by_name
    song
  end

  def self.create_by_name(name)
    #instantiates a new object, gives the object a name, adds the object to the class variable, and returns the object.
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #If we already created the song we say it exists. If we haven't created the song we create it and add it to the list.
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} #sorts @all array by the song name in alphabetical order
  end

  def self.new_from_filename(filename)
    #We turn the mp3 string into an array.
    #We remove the first part of the array for the artist's name and store in artist variable
    #We remove the second part of the array for the song_name.mp3
    #We turn song_name.mp3 into an array about delimiter of "." and store that under break_up_mp3_string variable
    #We take the first position of break_up_mp3_string to get the song name
    #Create a new instane of the object, give it the artist_name from artist variable, give song name from song_name variable
    break_up_filename = filename.split(" - ")
    artist = break_up_filename[0]
    mp3_string = break_up_filename[1]
    break_up_mp3_string = mp3_string.split(".")
    song_name = break_up_mp3_string[0]
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    #We turn the mp3 string into an array.
    #We remove the first part of the array for the artist's name and store in artist variable
    #We remove the second part of the array for the song_name.mp3
    #We turn song_name.mp3 into an array about delimiter of "." and store that under break_up_mp3_string variable
    #We take the first position of break_up_mp3_string to get the song name
    #Create a new instane of the object, give it the artist_name from artist variable, give song name from song_name variable
    #Saves the new song to the class variable @@all
    break_up_filename = filename.split(" - ")
    artist = break_up_filename[0]
    mp3_string = break_up_filename[1]
    break_up_mp3_string = mp3_string.split(".")
    song_name = break_up_mp3_string[0]
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    #clears the class variable @@all
    self.all.clear
  end
end
