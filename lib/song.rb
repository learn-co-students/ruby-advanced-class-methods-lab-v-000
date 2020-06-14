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
    song.name = name
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
    @@all.find {|s| s.name == song_name}
  end
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end
  def self.new_from_filename(song_name)
    song = self.new
    array = song_name.split(" - ")
    song.artist_name = array[0]
    x = array[1].to_s.split(".")
    song.name = x[0]
    song
  end
  def self.create_from_filename(song_name)
    song = self.new
    array = song_name.split(" - ")
    song.artist_name = array[0]
    x = array[1].to_s.split(".")
    song.name = x[0]
    @@all << song
    song
  end
  def self.destroy_all
    @@all.clear
  end
end
