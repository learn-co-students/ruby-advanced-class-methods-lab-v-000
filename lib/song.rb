require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil)
    @name = name
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new(song_name)
    song
  end

  def self.create_by_name(song_name = nil)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name = nil)
    @@all.detect{|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by!{ |m| m.name.downcase }
  end

  def self.new_from_filename(file_name)
    string_no_mp3 = file_name.chomp(".mp3")
    name_song_array = string_no_mp3.split(" - ")
    artist_name = name_song_array[0]
    song_name = name_song_array[1]
    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end
end
