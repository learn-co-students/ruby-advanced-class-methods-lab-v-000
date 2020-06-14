require "pry"

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
    # class constructor
    # initializes a song and saves it to @@all
      # through class method @Song.all
    # return the song instance

    self.new.save
    self.all.last
  end

  def self.new_by_name(name)
    #class constructor
    # input: string name of a song: name
    # output: a song instance with that name set as its name

    song = self.new
    song.name = name
    song

  end

  def self.create_by_name(name)
    #class constructor
    # input: string name
    # output: song instance, song saved to @@all

    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    #class finder
    # input: string name
    # output: matching instance
    self.all.detect {|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.parse(filename)
    # parses filename in .mp3
    #returns an array with [artist, name]
    info = []
    parsed = filename.split(" - ")
    info << parsed[0]
    info << parsed[1].chomp(".mp3")
    info
  end
  def self.new_from_filename(filename)
    #input: " -.mp3 "
    song = self.new_by_name(self.parse(filename)[1])
    song.artist_name = self.parse(filename)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create_by_name(self.parse(filename)[1])
    song.artist_name = self.parse(filename)[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end






end
