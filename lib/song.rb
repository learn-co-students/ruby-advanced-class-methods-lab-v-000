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
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = Song.new 
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
       Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(filename)
    song_array = filename.chomp(".mp3").split(" - ")
    new_song = Song.create_by_name(song_array[1])
    new_song.artist_name = song_array[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    song_array = filename.chomp(".mp3").split(" - ")
    new_song = Song.create_by_name(song_array[1])
    new_song.artist_name = song_array[0]
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
