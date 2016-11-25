require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = name
    song.artist_name = name
    @@all << song
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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    song = self.new
  end

  def self.alphabetical
    self.all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_parts = filename.split(" - ")
    artist_name = song_parts[0]
    song_name = song_parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
