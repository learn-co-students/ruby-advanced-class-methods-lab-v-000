#require 'pry'

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
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.detect {|song| song.name == name} == nil
      song = self.create_by_name(name)
    else 
      @@all.detect {|song| song.name == name}
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    full_name = filename.split(".")[0]
    song_name = full_name.split(" - ")[1]
    song = self.new_by_name(song_name)
    song.artist_name = full_name.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    full_name = filename.split(".")[0]
    song_name = full_name.split(" - ")[1]
    song = self.create_by_name(song_name)
    song.artist_name = full_name.split(" - ")[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
