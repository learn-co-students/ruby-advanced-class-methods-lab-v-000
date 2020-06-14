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
    Song.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    Song.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #"Thundercat - For Love I Come.mp3"
    song = Song.new
    new_song = filename.split(" - ")
    song.artist_name = new_song[0]
    song.name = new_song[1].split(".")
    song.name = song.name[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    new_song = filename.split(" - ")
    song.artist_name = new_song[0]
    song.name = new_song[1].split(".")
    song.name = song.name[0]
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
