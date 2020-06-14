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
    self.all.detect{|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if name == self.find_by_name(name)
      self.find_by_name(name)
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song_info|
      song_info.instance_variable_get("@name")[0]}

  end

  def self.new_from_filename(filename)
    filename.slice!".mp3"
    data = filename.split(" - ")
    artist = data[0]
    name = data[1]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
