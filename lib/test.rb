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
  def self.new_from_filename(filename)
    entries = filename.split(" - ")

    artist_name = entries[0]
    name = entries[1]
    name=name.gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = name

    song
  end
  end

  def self.create_from_filename(filename)
   binding.pry
   entries = filename.split(" - ")
   binding.pry
   artist_name = entries[0]
   name = entries[1]
   name=name.gsub(".mp3", "")

   song = self.new
   song.artist_name = artist_name
   song.name = name

   song
  end
