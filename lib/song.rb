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
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name, artist_name = nil)
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_by_name(song_name, artist_name = nil)
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    x = filename.split(" - ")
    artist_name = x[0]
    y = x[1].split(".")
    song_name = y[0]
    self.new_by_name(song_name, artist_name)
  end

  def self.create_from_filename(filename)
    x = filename.split(" - ")
    artist_name = x[0]
    y = x[1].split(".")
    song_name = y[0]
    self.create_by_name(song_name, artist_name)
  end

  def self.destroy_all
    self.all.clear
  end
end
