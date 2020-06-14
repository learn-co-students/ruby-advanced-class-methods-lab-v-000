class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name = "", artist_name = "")
  #   @name = name
  #   @artist_name = artist_name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    song = nil
    song = Song.all.detect {|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    sorted = []
    sorted = Song.all.sort_by{|song| song.name}
    sorted
  end

  def self.create_by_filename(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    song_name, artist = self.name_and_artist(filename)
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.new_from_filename(filename)
    song = self.create
    song_name, artist = self.name_and_artist(filename)
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.name_and_artist(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1][0...-4]
    [name, artist]
  end

end
