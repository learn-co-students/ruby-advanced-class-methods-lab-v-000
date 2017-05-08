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
    song.name=(song_name)
    song.save
    song
  #  binding.pry
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.all.any? {|song| song.name == song_name}
      self.find_by_name(song_name)
    else
      self.new_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info = []
    m = /\.mp3/.match(filename)
    info = m.pre_match.split(" - ")
    name_of_artist = info[0]
    song_name = info[1]
    song = self.create_by_name(song_name)
    song.artist_name=(name_of_artist)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end

