require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end # do end
  end #method end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename) #filename format: "Taylor Swift - Blank Space.mp3"
    file_array = filename.split(/ \W |[.]/)
    song = self.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end

Song.new_from_filename("Taylor Swift - Blank Space.mp3")
