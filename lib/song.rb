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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
      @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
# binding.pry
    # song = self.new
    filename = filename.split(/( - )|\./)
    song = self.new_by_name(filename[2])
    song.artist_name = filename[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
# Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
# The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.
#


end
# binding.pry
