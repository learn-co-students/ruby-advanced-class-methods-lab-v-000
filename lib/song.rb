require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    self.all << song
    song
  end

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def Song.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def Song.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def Song.new_from_filename(file_name)
    artist_and_name = file_name.split(' - ')
    artist_name = artist_and_name[0]
    song_name = artist_and_name[1].chomp('.mp3')
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    self.all << song
    song
  end

  def Song.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def Song.destroy_all
    self.all.clear
  end






end