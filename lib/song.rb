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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.detect { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      return Song.find_by_name(song_name)
    else Song.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    
    splitFile = filename.split(" - ")
    shortenedName = splitFile[1].chomp(".mp3")    
    song = self.new
    song.name = shortenedName
    song.artist_name = splitFile[0]
    song
  end

  def self.create_from_filename(filename)     
    splitFile = filename.split(" - ")
    shortenedName = splitFile[1].chomp(".mp3")    
    song = self.new
    song.name = shortenedName
    song.artist_name = splitFile[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
