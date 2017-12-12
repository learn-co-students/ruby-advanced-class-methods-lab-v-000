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

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(string_name)
    s = self.new
    s.name = string_name
    s
  end

  def self.create_by_name(song_name)
    s = self.new
    s.save
    s.name = song_name
    s
  end

  def self.find_by_name(song)
    @@all.detect {|s| song == s.name}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
      self.create_by_name(song)
    else self.find_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|w| w.name}
  end

  def self.new_from_filename(song_mp3)
    s = self.new
    song = song_mp3.split(" - ")
    artist_name = song[0]
    name = song[1].gsub(".mp3", "")
    s.name = name
    s.artist_name = artist_name
    s
  end

  def self.create_from_filename(song_mp3)
    s = self.new
    song = song_mp3.split(" - ")
    artist_name = song[0]
    name = song[1].gsub(".mp3", "")
    s.name = name
    s.artist_name = artist_name
    s.save
  end

  def self.destroy_all
    @@all.clear
  end

end
