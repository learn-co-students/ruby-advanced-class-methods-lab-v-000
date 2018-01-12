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
      song = self.new
      self.all << song
      song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    self.all << song
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|song| song.name == string_name}
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title)
      found_song = find_by_name(title)
    else
      create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
    #accept one argument
    #seperate string into array by "-"
    #assign array[0] to artist_name
    #remove ".mp3" from array[1]
    #assign array[1] to song_name

    #create a new instance of the song class with .new
    #assign name with name writer (song.name = name)
    #assign song with artist_name writer
    #return song
    #end
    file_array = file_name.split("-")
    artist_name = file_array[0].rstrip

    song_array = file_array[1].split(".")
    name = song_array[0].lstrip

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    #accept one argument
    #seperate string into array by "-"
    #assign array[0] to artist_name
    #remove ".mp3" from array[1]
    #assign array[1] to song_name

    #create a new instance of the song class with .new
    #assign name with name writer (song.name = name)
    #assign song with artist_name writer
    #save song
    #return song
    #end
    file_array = file_name.split("-")
    artist_name = file_array[0].rstrip

    song_array = file_array[1].split(".")
    name = song_array[0].lstrip

    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end



end
