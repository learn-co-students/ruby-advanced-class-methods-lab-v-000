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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
   new_song.name = (name)
   new_song
  end

  def self.create_by_name(name)
    song_created = self.new_by_name(name)
    @@all << song_created
    song_created
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    new_file = file.split(" - ")
    artist = new_file[0]
    song = new_file[1].chomp(".mp3")
    new_song = self.create
    new_song.artist_name = artist
    new_song.name = song
    new_song
  end

  def self.create_from_filename(file)
    new_file = file.split(" - ")
    artist = new_file[0]
    song = new_file[1].chomp(".mp3")
    new_song = self.create
    new_song.artist_name = artist
    new_song.name = song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
