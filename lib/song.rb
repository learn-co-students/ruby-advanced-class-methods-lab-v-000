require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  #def initialize
  #  self
  #  @@all << self
#  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new_by_name(name)
    s.save.uniq
    s
  end

  def self.find_by_name(name)
    @@all.detect do |song|
    song.name == name
     end
    end

  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s == nil
    self.create_by_name(name)
  else
    s
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_name)
    data = song_name.split(" - ")
    artist = data[0]
    song = data[1].gsub(".mp3","")
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(song_name)
    s = self.new_from_filename(song_name)
    s.save
    s
  end

  def self.destroy_all
    @@all = []
  end

end
