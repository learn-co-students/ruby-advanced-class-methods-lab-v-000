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

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(song_info)
    metadata = song_info.gsub(/.mp3/, '').split(" - ")
    new_song = Song.new_by_name(metadata[1])
    new_song.artist_name = metadata[0]
    new_song
  end

  def self.create_from_filename(song_info)
    metadata = song_info.gsub(/.mp3/, '').split(" - ")
    new_song = Song.create_by_name(metadata[1])
    new_song.artist_name = metadata[0]
  end

  def self.destroy_all
    self.all.clear
  end
end
