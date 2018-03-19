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
    new_song.save
    new_song
  end

  def self.create_by_name(song_name)
    # self.create
    new_song = self.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    # self.create
    new_song = self.new
    new_song.name = song_name
    new_song
    # self.name
  end

  def self.find_by_name (song_name)
    self.all.detect{ |i| i.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name (song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = @@all.clear
  end
end
