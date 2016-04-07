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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name = name
    song
  end


  def Song.find_by_name(name)
    self.all.detect { |e| e.name == name }
  end

  def Song.find_or_create_by_name(name)
    Song.create_by_name(name) || Song.find_by_name(name)
  end

  def Song.alphabetical
    self.all.sort_by { |e| e.name }
  end

  def self.new_from_filename(filename)
    names = filename.split("-")
    artist_name = names[0].strip
    song_name = names[1].gsub(".mp3", "").strip
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
  #  binding.pry
    song
  end

  def self.create_from_filename(filename)
    names = filename.split("-")
    artist_name = names[0].strip
    song_name = names[1].gsub(".mp3", "").strip
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
  #  binding.pry
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
