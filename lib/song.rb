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
    self.all.push(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name =name
    song
  end

  def self.create_by_name(name)
    self.all.push(self.new_by_name(name))
    @@all.last
  end

  def self.find_by_name(name)
    self.all.detect {|d| name == d.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|n| n.name}
  end


  def self.new_from_filename(artist_and_song_name)
    song = self.new
    song.name =artist_and_song_name.split("-")[1].split(".")[0].strip
    song.artist_name =artist_and_song_name.split("-")[0].strip
    song
  end

  def self.create_from_filename(artist_and_song_name)
    self.new_from_filename(artist_and_song_name).save
  end

  def self.destroy_all
    self.all.clear
  end

end
