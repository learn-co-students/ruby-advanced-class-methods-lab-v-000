class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#Build a class constructor Song.create that initializes a song and saves it
#to the @@all class variable either literally or through the class method
#Song.all. This method should return the song instance that was initialized and saved.
  def self.create
    song = self.new
    song.save
    song
  end

#Build a class constructor Song.new_by_name that takes in the string name of a
#song and returns a song instance with that name set as its name property.
#Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

#Build a class constructor Song.create_by_name that takes in the string name of
# a song and returns a song instance with that name set as its name property
#and the song being saved into the @@all class variable.
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

#Build a class finder Song.find_by_name that accepts the string name of a song
#and returns the matching instance of the song with that name.
  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

#In order to prevent duplicate songs being created that actually represent the same
#song (based on the song name), we're going to build a Song.find_or_create_by_name
#class method. This method will accept a string name for a song and either return
#a matching song instance with that name or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

#Build a class method Song.alphabetical that returns all the songs in ascending (a-z) alphabetical order.
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  #Build a class constructor that accepts a filename in the format of " - .mp3",
  # for example "Taylor Swift - Blank Space.mp3".
  def self.new_from_filename(file_name)
    file_name = file_name.split(" - ")
    artist_name = file_name[0]
    song_name = file_name[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

#Build a class constructor that accepts a filename in the format of " - .mp3",
#for example "Taylor Swift - Blank Space.mp3". The Song.create_from_filename
#class method should not only parse the filename correctly but should also save the Song instance that was created.
  def self.create_from_filename(file_name)
    file_name = file_name.split(" - ")
    artist_name = file_name[0]
    song_name = file_name[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.destroy_all
    self.all.clear
  end
end
