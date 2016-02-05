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

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song.save
    new_song
  end
 
  def self.find_by_name(title)
    self.all.detect{ |song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      new_song = self.new
      new_song.name = title
      new_song.save
      new_song
    end
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(song)
    artist_name_split = song.split(/\A(.+)\s-\s(.+).mp3\z/)
    new_song = self.new
    new_song.artist_name = artist_name_split[1]
    new_song.name = artist_name_split[2]
    new_song
  end

  def self.create_from_filename(song)
    artist_name_split = song.split(/\A(.+)\b\s-\s\b(.+).mp3/)
    new_song = self.new
    new_song.artist_name = artist_name_split[1]
    new_song.name = artist_name_split[2]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
