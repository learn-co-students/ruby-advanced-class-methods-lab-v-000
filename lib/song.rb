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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
    #binding.pry
  end

  def self.new_from_filename(string)
    array = string.split(" - ")
    artist_name = array[0]
    song_name = array[1].split(".")[0]
    #binding.pry
    new_song = Song.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(string)
    array = string.split(" - ")
    artist_name = array[0]
    song_name = array[1].split(".")[0]
    #binding.pry
    new_song = Song.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    Song.all.clear
  end
end
