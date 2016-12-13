require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@songs = []          #Changed from @@all

  def self.all
    @@songs               #Changed from @@all
  end

  def save # a method that only operates on instances of Song; not on the Song class itself
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
      song = Song.new         #creates the new song.
      song.name = song_name   #gives it a name
      song                    #instance of Song
  end

  def self.create_by_name(song_name)
      song = Song.new_by_name(song_name)
      song.save      
      song                    #instance of Song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@songs.sort_by do |song|
      #binding.pry
      song.name
    end
  end
end
