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
    self.all.detect{|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.new_by_name(song_array[1].slice(0...-4))
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.create_by_name(song_array[1].slice(0...-4))
    song.artist_name = song_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
