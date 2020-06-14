require "pry"

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    !find_by_name(name) ? create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_arr = filename.sub(/\.mp3/, "").split(" - ")
    artist = song_arr[0]
    name = song_arr[1]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song_arr = filename.sub(/\.mp3/, "").split(" - ")
    artist = song_arr[0]
    name = song_arr[1]
    song = self.create
    song.name = name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
