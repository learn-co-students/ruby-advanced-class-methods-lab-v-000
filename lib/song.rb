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
    song.save
    song
  end
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name==name
    end
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)==nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort do |x,y|
      x.name<=>y.name
    end
  end
  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1].chomp(".mp3")
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end
  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1].chomp(".mp3")
    song = Song.new
    song.name = name
    song.artist_name = artist
    song.save
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
