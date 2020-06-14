require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self unless self.class.all.detect {|song| song.name == name}
  end

  def self.create
    song = Song.new(name)
    song.save
    song
  end

  def self.new_by_name(song)
    name = song
    song = self.new(name)
    song.name = name
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song.save
    song
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_arr = filename.split(" - ")
    artist_name = file_arr[0]
    song_name = file_arr[1].sub(".mp3", "")
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    file_arr = filename.split(" - ")
    artist_name = file_arr[0]
    name = file_arr[1].sub(".mp3", "")
    created = self.create_by_name(name)
    created.artist_name = artist_name
    created

  end

end
