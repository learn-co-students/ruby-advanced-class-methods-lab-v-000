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
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

end

#Song.new_by_name("Fuckker")
