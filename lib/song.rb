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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    name_split = name.split(" - ")
    artist_name = name_split[0]
    song_name = name_split[1].scan(/./).slice(0, name_split[1].length-4).join
    new_song = Song.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(name)
    new_song = Song.new_from_filename(name)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
