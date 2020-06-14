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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end


  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect { |e| e.name == name }
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
    @@all.sort_by { |song| song.name[0] }
  end

  def self.new_from_filename(filename)
    #parse the filename and assign to song variables
    song_data = filename.split(" - ")
    name = song_data[1].gsub(".mp3","")
    artist_name = song_data[0]

    #create new song instance if song doesn't already exist
    song = self.find_or_create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    #parse the filename and assign to song variables
    song_data = filename.split(" - ")
    name = song_data[1].gsub(".mp3","")
    artist_name = song_data[0]

    #create new song instance if song doesn't already exist
    song = self.find_or_create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
