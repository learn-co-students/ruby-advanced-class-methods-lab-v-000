require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|person| person.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
      song = self.new
      song.artist_name = data[0]
      song.name = data[1].gsub(".mp3", "")
      song
  end

=begin

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
end

=end

  def self.create_from_filename(filename)

    data = filename.split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1].gsub(".mp3", "")
    song.save
    song
  end

=begin #there's a difference between mine and the below ... mine passes the test but
is it sufficient??

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end
=end

  def self.destroy_all
    @@all.clear
  end

end
