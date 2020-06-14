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
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == "#{song_name}"}
  end


  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)

    #if self.find_by_name(song_name)
      #self.find_by_name(song_name)
    #else
      #self.create_by_name(song_name)
    #end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(song_filename)
    song = self.new
    song_elements = song_filename.split(/\s\-\s|\.\w+/)
    song.artist_name = song_elements[0]
    song.name = song_elements[1]
    song
  end

  def self.create_from_filename(song_filename)
    song_elements = song_filename.split(/\s\-\s|\.\w+/)
    song = self.create
    song.name = song_elements[1]
    song.artist_name = song_elements[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
