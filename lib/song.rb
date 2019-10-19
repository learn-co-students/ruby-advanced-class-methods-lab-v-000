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
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(new_song)
    self.find_by_name(new_song) || self.create_by_name(new_song)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename = File.basename(filename, ".mp3")
    filename_array = filename.split(" - ")
    artist_name = filename_array[0]
    name = filename_array[1]

    song = self.new
    song.save
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    filename = File.basename(filename, ".mp3")
    filename_array = filename.split(" - ")
    artist_name = filename_array[0]
    name = filename_array[1]

    song = self.new
    song.save
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.destroy_all
    @@all = []
  end
end
