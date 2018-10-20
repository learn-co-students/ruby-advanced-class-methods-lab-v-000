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

def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = Song.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  @@all.find do |song|
    song.name == name
  end
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create_by_name(name)
end

def self.alphabetical
  @@all.sort_by { |song| song.name}
end

def self.new_from_filename(filename)
  file_name = filename.split(" - ")
    artist_name = file_name[0]
    song_name = file_name[1].gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
end

def self.create_from_filename(filename)
  file_name = filename.split(" - ")
    artist_name = file_name[0]
    song_name = file_name[1].gsub(".mp3", "")

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
end

def self.destroy_all
  @@all.clear
end
  
end
