class Song

  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @@create
  #
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # instantiates and saves the song to @@all
    # returns the new song that was created
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    # instantiates a song with a name property
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # reuse #self.create here to instantiate song to @@all and instantiates and saves a song with a name property
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    # can find a song in @@all by name
    self.all.detect {|song|  song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    # invokes #find_by_name and #create_by_name
    # returns the existing Song object (doesn't create a new one) when provided title of an existing Song
    #  creates new Song object w/the provided title if one doesn't exist
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    # returns all the song instances in alphabetical order by song name
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    #initializes a song and artist_name based on the filename format
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

   def self.create_from_filename(filename)
    #initializes and saves a song and artist_name based on the filename
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    #clears all the song instances from the @@all array
    self.all.clear
  end

end
