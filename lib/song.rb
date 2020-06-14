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
    new_song = Song.new
    Song.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    Song.all << new_song
    new_song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) ? Song.find_by_name(name) : Song.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    song_array = filename.split(/(\s-\s)|\./)
    new_song.artist_name = song_array[0]
    new_song.name = song_array[2]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new
    song_array = filename.split(/(\s-\s)|\./)
    new_song.artist_name = song_array[0]
    new_song.name = song_array[2]
    Song.all << new_song
    new_song
  end

  def self.destroy_all
    Song.all.clear
  end

end
