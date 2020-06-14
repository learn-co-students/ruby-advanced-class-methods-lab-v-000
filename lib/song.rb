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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|x, y| x.name <=> y.name}
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    artist = file_array[0]
    song_name = file_array[1].gsub(".mp3", "")
    song = Song.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file).tap{|song| song.save}
  end

  def self.destroy_all
    @@all.clear
  end
end
