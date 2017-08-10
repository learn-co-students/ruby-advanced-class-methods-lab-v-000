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
    song.name = @name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].chomp(".mp3")

  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].chomp(".mp3")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end

end
