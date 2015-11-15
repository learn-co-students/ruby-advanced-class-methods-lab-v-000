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

  def self.new_by_artist(artist)
    song = Song.new
    song.artist_name = artist
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by{|song|song.name}
  end


  def self.new_from_filename(file)
    title = file.sub(".mp3","").split(" - ").last
    artist = file.sub(".mp3","").split(" - ").first
    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

  def self.destroy_all
    self.all.clear
  end

end
