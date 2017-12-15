require 'pry'

class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def initialize(name="", artist_name="")
    @name = name
    @artist_name = artist_name
  end

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

  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song
  end

  def self.create_by_name(new_song)
    song = self.new_by_name(new_song)
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect { |song_instance| song_instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song_instance| song_instance.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(/ - |\./)
    song = self.create_by_name(array[1])
    song.artist_name = array[0]
    song.filename = array[2]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
