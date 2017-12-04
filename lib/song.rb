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

  def self.new_by_name(new_song_name)
    new_song = self.new
    #@@all << new_song
    new_song.name = new_song_name
    new_song
  end

  def self.create_by_name(new_song_name)
    new_song = self.new
    @@all << new_song
    new_song.name = new_song_name
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    new_array = @@all.sort_by {|song| song.name}
    new_array
  end

  def self.new_from_filename(new_song)
    song_array = new_song.split(' - ')
    song_array[1] = song_array[1].sub(/.mp3/, '')
    created_song = new_by_name(song_array[1])
    created_song.artist_name = song_array[0]
    created_song
  end

  def self.create_from_filename(new_song)
    song_array = new_song.split(' - ')
    song_array[1] = song_array[1].sub(/.mp3/, '')
    created_song = create_by_name(song_array[1])
    created_song.artist_name = song_array[0]
    created_song
  end

  def self.destroy_all
    @@all.clear
  end

end
