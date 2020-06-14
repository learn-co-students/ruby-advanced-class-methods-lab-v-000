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
    name = self.new
    name.name = song_name
    name
  end
  def self.create_by_name(song_name)
    name = self.create
    name.name = song_name
    name
  end
  def self.find_by_name(song_name)
     self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    name = self.new
    name.name = song_name
    name.artist_name = artist_name
    name
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    name = self.create
    name.name = song_name
    name.artist_name = artist_name
    name
  end

  def self.destroy_all
    @@all.clear
  end
end
