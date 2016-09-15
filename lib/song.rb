require 'pry'

class Song
  attr_accessor :name, :artist_name, :genre

  @@all = []

  def save
    self.class.all << self
  end

  def self.create
    @song = Song.new
    @song.save
    @song
  end

  def self.new_by_name(name)
    @song = Song.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = Song.create
    @song.name = name
    @song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)  #.detect would be more concise, but this adds flexibility for multiple songs with same name
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    artist = song[0]
    song_name = song[1].gsub(/[.].*/,"")

    @song = self.new_by_name(song_name)
    @song.artist_name = artist
    @song
  end

  def self.create_from_filename(filename)
    song = filename.split(" - ")
    artist = song[0]
    song_name = song[1].gsub(/[.].*/,"")

    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    all.clear
  end
end
