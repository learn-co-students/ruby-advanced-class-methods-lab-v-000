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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    create_by_name(name) unless find_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by! { |a| a.name }
  end

  def self.new_from_filename(filename)
    song_artist_arr = filename.split(/\s[-]\s|.mp3/)
    new_song = self.new
    new_song.artist_name = song_artist_arr[0]
    new_song.name = song_artist_arr[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
