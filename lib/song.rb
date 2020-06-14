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

  def self.new_by_name(name)#Assign instance variable, return the instance
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)

    new_song = Song.create
    new_song.name = name
    new_song

  end


  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.create_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song_name| song_name.name }
  end

  def self.new_from_filename(file)#So here I should call create_by_name. Also, initialize always means calling.new
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)#OK so gsub replaces the first argument you give it with the second argument you give it
  parts = file.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end
end
