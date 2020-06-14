class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

# Build a class constructor Song.create that initializes a song and saves it to the @@all class variable either literally or through the class method Song.all.
# This method should return the song instance that was initialized and saved.
  def self.create
    song = self.new
    song.save
    song
  end

# Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance
# with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name

    end
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)

  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    filename = filename.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    filename = filename.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].gsub(".mp3", "")
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
