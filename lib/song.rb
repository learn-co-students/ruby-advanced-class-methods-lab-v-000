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
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    @@all << new_song
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find {|index| index.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|index| index.name}
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    file_array = file_name.split(" - ")
    new_song.name = (file_array[1][0..-5])
    new_song.artist_name = file_array[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new
    file_array = file_name.split(" - ")
    new_song.name = (file_array[1][0..-5])
    new_song.artist_name = file_array[0]
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

#song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
