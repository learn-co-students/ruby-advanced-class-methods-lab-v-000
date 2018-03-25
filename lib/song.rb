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
  # My original code below. Realizing that the code could be completed
  # song = self.new
  #  song.save
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)

    self.all.detect {|song| song.name == song_name}
    # note* tried to use .select, but using .detect -  Enumerable - is more efficient
    #self.all.each do |song|
    #  return song if song.name == song_name
    #end

  end


  def self.find_or_create_by_name(name)

    self.find_by_name(name) || self.create_by_name(name)
    # Below is the orginal code, can be made more abstract by code above
    #  if self.find_by_name(name) == nil
    #    self.create_by_name(name)
    #  else
    #    self.find_by_name(name)
    #  end
  end



  def self.alphabetical
    self.all.sort_by {|songs| songs.name}
  end


  def self.new_from_filename(song)
    parse_song = song.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = parse_song[1]
    song.artist_name = parse_song[0]
    song
  end
# SONG.CREATE_FROM_FILENAME
# Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
# The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.

  def self.create_from_filename(song)
    parse_song = song.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = parse_song[1]
    song.artist_name = parse_song[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
