require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by!{|s| s.name}
  end

  def self.new_from_filename(filename)
    song = filename.split(".mp3")[0].to_s.split(" - ")
    new_song = self.new
    new_song.artist_name = song[0]
    new_song.name = song[1]
    new_song
  end

  def self.create_from_filename(filename)
    song = filename.split(".mp3")[0].to_s.split(" - ")
    new_song = self.new
    new_song.artist_name = song[0]
    new_song.name = song[1]
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
