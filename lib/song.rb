require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  # def artist_name= (name)
  #   #artist = Artist.find_or_create_by_name(name)
  #   artist = name
  # end

  def self.create
    song = Song.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
    artist_and_song  = string.split(" - ")
    artist = artist_and_song[0]
    song_name = artist_and_song[1].chomp(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(string)
    artist_and_song  = string.split(" - ")
    artist = artist_and_song[0]
    song_name = artist_and_song[1].chomp(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
