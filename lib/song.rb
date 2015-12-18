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
    song = Song.new
    @@all << song

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
    @@all.detect {|i| i.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) == nil ? self.create_by_name(song_name) : self.find_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3")
    arr = file.split(" - ")
    song = self.new_by_name(arr[1])
    song.artist_name = arr[0]

    song
  end

  def self.create_from_filename(filename)
    file = filename.chomp(".mp3")
    arr = file.split(" - ")
    song = self.create_by_name(arr[1])
    song.artist_name = arr[0]

    song
  end

  def self.destroy_all
    @@all.clear
  end

end
