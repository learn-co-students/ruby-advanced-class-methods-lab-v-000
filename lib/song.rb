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

  def self.create(name=nil, artist_name=nil)
    #binding.pry
    song = self.new #initialize song
    song.name = name # set song name
    song.artist_name = artist_name
    @@all << song # add song to list of all songs
    song # return the new song
  end

  def self.new_by_name(name)
    #binding.pry
    self.create(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name} # detect returns first object from the array that meets the condition we set. so it's going through and looking for the first thing to match name
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name) # if unable to find a song with this name
      self.create_by_name(name) # create that song
    else
      self.find_by_name(name) # or if the name exists, find and return it
    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(" - ") # split filename at -
    @name = song_name.split(".")[0] # split the song name to get rid of .mp3, the name becomes index 0
    @artist_name = artist_name
    self.create(@name, @artist_name) # call #create on this instance, and pass it our new info
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
