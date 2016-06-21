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
    self.all << song
    song
  end

  def self.new_by_name (song_name)
    song = Song.new
    song.name  = song_name
    song
  end

  def self.create_by_name (song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name (song_name)
    self.all.detect{|songs| songs.name == song_name}
  end

  def self.find_or_create_by_name (song_name)
    if !self.all.detect{|songs| songs.name == song_name}
      self.create_by_name(song_name)
    else
      self.all.detect{|songs| songs.name == song_name}
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename (filename)
    song_data = filename.split(".")
    song_data.pop
    song_data = song_data.join
    song_data = song_data.split(" - ")

    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end

  def self.create_from_filename (filename)
    song_data = filename.split(".")
    song_data.pop
    song_data = song_data.join
    song_data = song_data.split(" - ")

    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
