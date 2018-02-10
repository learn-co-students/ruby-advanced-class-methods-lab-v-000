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
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    self.all<< new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{ |song| song.name==name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |w| w.name }
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    filename_charac = filename.split(" - ")
    new_song.artist_name = filename_charac[0]
    filename_sub_charac = filename_charac[1].split('.')
    new_song.name = filename_sub_charac[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
