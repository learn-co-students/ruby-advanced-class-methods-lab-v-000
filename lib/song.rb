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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new #if i do song = self.create this interferes w/ the alphabetical method b/c the .create method
                    #will save each song and the tests will say that i have two of each song in my song array
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |single|
      single.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #remember to use argument when defining & calling methods
  end

  def self.alphabetical
    self.all.sort_by do |single|
      single.name
    end
  end

  def self.new_from_filename(file_ID)
    song = self.new
    filename = file_ID.split(" - ")
    name = filename[1]
    artist_name = filename[0]
    song.name = name.sub(".mp3", "") #find alternative to delete, sub and gsub
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_ID)
    song = self.new_from_filename(file_ID)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
