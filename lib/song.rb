require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    return self.new
  end

  def self.new_by_name(input)
    variable = self.new
    variable.name = input
    return variable
  end

  def self.create_by_name(input)
    variable = self.new
    variable.name = input
    return variable
  end

  def self.find_by_name(name)
    return self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(input)
    if self.find_by_name(input) == nil
      self.create_by_name(input)
    else
       self.find_by_name(input)
    end
  end

  def self.alphabetical
    return self.all.sort_by {|x| x.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(song)
    new_artist = self.new
    new_split = song.split(" - ")
	  new_artist.artist_name = new_split[0]
	  raw_song = new_split[1]
	  new_title = raw_song.split(".")
	  new_artist.name = new_title[0]
    return new_artist
  end

  def self.create_from_filename(song)
    new_artist = self.new
    new_split = song.split(" - ")
	  new_artist.artist_name = new_split[0]
	  raw_song = new_split[1]
	  new_title = raw_song.split(".")
	  new_artist.name = new_title[0]
    return new_artist
  end

end
