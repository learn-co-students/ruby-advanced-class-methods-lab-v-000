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


  # delete(filename.last)
  # name = filename.third
  # artist_name = filename.first


  # Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
  #
  # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space
  #  and the artist_name set to Taylor Swift. The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3 must be parsed for
  #  the relevant components. Separate the artist name from the rest of the data based on the - delimiter. Don't forget that when you parse the song name, you have to
  #  remove the '.mp3' part of the string.


end
# binding.pry
