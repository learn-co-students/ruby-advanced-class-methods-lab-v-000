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

  def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.save
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if song = self.find_by_name(song_name)
      song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical

    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    #binding.pry
    data = filename.chomp(".mp3").split(" - ")
    artist_name = data[0]
    name = data[1]
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    artist_name = data[0]
    name = data[1]
    song = self.new
    song.save
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
