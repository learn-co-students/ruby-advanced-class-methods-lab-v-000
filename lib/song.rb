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

  def self.create(track)
    song = self.new
    song.name = track
    @@all << self.name
    binding.pry
  end

end

song = Song.create("The Middle")
puts Song.all.include?(song) #=> true