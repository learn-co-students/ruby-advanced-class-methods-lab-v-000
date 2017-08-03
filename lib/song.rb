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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song
  end

  def self.find_by_name(song_name)
    #self.all.detect(self.create_by_name(song_name)) {|item| item.name == song_name}
    self.all.detect {|item| item.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |item| item.name}
  end

  def self.new_from_filename(filename)
    filename = filename.gsub!(".mp3", "")
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    filename = filename.gsub!(".mp3", "")
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
