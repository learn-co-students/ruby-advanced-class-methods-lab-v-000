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

  def self.create(song_name = nil, artist_name =nil)
    song = Song.new
    song.name = song_name
    song.artist_name= artist_name
    song.save
    song
  end

  def self.new_by_name(song_name)
    self.create(song_name)
  end

  def self.create_by_name(song_name)
    self.create(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect {|obj| obj.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    artist = ""
    song = ""
    data = filename.scan(/(.+)\s\-\s(.+)\.mp3/)
    artist = data[0][0]
    song = data[0][1]
    self.create(song,artist)
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
