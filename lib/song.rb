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
    @@all << song
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
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@abc_all = @@all.sort_by{|song| song.name}
    @@abc_all
  end

  def self.new_from_filename(file)
    array = file.split(".")
    new_string = array[0]
    new_array = new_string.split(" - ")
    artist_name = new_array[0]
    song_name = new_array[1]
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    array = file.split(".")
    new_string = array[0]
    new_array = new_string.split(" - ")
    artist_name = new_array[0]
    song_name = new_array[1]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
