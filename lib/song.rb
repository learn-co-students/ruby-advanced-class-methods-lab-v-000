require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song =  self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == song_name
      song_name
    else
      new_song = self.create_by_name(song_name)
      new_song
    end
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(mp3name)
    song = self.new
    mp3name = mp3name.split(' - ') 
    song.artist_name = mp3name[0]
    song.name = mp3name[1].chomp('.mp3')
    song
  end

  def self.create_from_filename(mp3name)
    song = self.new_from_filename(mp3name)
    song.save << song

  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
