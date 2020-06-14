class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # instantiates and saves the song, and it returns the new song that was created
  def self.create
    song = self.new
    song.save
    song
  end

  # takes in the string name of a song and returns a song instance with
  # that name set as its name property. `Song.new_by_name` should return an
  # instance of `Song` and not a simple string or anything else
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  # takes in the string name of a song and returns a song instance with that
  # name set as its name property and the song being saved into the `@@all` class variable
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  # class finder `Song.find_by_name` that accepts the string name of a song and
  # returns the matching instance of the song with that name
  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) # Taylor Swift - Blank Space.mp3
    filename_split = filename.split(" - ")
    artist_name = filename_split[0]
    song_name = filename_split[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename) # Taylor Swift - Blank Space.mp3
    filename_split = filename.split(" - ")
    artist_name = filename_split[0]
    song_name = filename_split[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
