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

  def self.new_by_artist_and_name(artist_name, name)
    song = Song.new
    song.artist_name = artist_name
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name 
    song.save
    song
  end

  def self.create_by_artist_and_name(artist_name, name)
    song = Song.new
    song.name = name 
    song.artist_name = artist_name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |i|
      i.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|i| i.name }
  end

  def self.new_from_filename(artist_song)
     artist_song_array = artist_song.split(/\s-\s/)
     name_mp3 = artist_song_array[1].split(".")
     self.new_by_artist_and_name(artist_song_array[0], name_mp3[0])
   end

   def self.create_from_filename(artist_song)
    artist_song_array = artist_song.split(/\s-\s/)
    name_mp3 = artist_song_array[1].split(".")
    self.create_by_artist_and_name(artist_song_array[0], name_mp3[0])
   end

  def self.destroy_all
    self.all.clear
  end
  

end
