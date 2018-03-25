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
    song = new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    create_by_name(song_name) unless find_by_name(song_name)
    find_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by{|object| object.name.downcase}
  end

  def self.new_from_filename(file_name)
    song_artist, song_name = file_name.chomp('.mp3').split('-')
    song = new_by_name(song_name.strip)
    song.artist_name = song_artist.strip
    song
  end

  def self.create_from_filename(file_name)
    song_artist, song_name = file_name.chomp('.mp3').split('-')
    song = find_or_create_by_name(song_name.strip)
    song.artist_name = song_artist.strip
    song
  end

  def self.destroy_all
    all.clear
  end
end
