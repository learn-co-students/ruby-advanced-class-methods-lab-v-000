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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if all.include?(name)
      self.all.detect {|song| song.name == name}
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)

    row = song

    data = row.split(" - ")
    artist_name = data[0]
    song_name = data[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song)
    song = self.new_from_filename(song)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
