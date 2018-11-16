class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
      @name = name
      self.class.all << self
    end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#Song.create
# initializes song & saves it to @@all
# either literally or via Song.all class method

  def self.create
# song = Song.create
# Song.all.include?(song)
  end

# takes in string name of song
# returns a song instance with that name as its name property
# returns instance of Song, NOT a simple string or anything else.
def self.new_by_name

end

# takes in string name of song
# returns song instance with that name as name property
# song is saved into the @@all class variable.
def self.create_by_name

end

# Class finder
# accepts string name of song
# returns matching instance of song with that name
  def self.find_by_name(name)
      self.all.find{|song| song.name == name}
  end

# prevent creation of duplicate songs
# accept string name for song
# return either matching song instance with that name
# or create new song with the name and return song instance.
  def self.find_or_create_by_name

  end

# class method returns all songs
# in ascending (a-z) alphabetical order.
# Use Array#sort_by.
  def self.alphabetical

  end
# return a new Song instance with song name & artist_name set e.g.:
# Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# song.name #=> "Blank Space"
# song.artist_name #=> "Taylor Swift"
    def self.new_from_filename

    end

# accepts filename in format
# "Taylor Swift - Blank Space.mp3"
# parse filename correctly & save Song instance
    def self.create_from_filename

    end

# class method reset state of @@all
# to empty array, deleting all previous song instances.
    def self.destroy_all

# class end below
end
Song.create_from_filename("Thundercat - For Love I Come.mp3")
Song.create_by_name("Blank Space")
Song.create_by_name("Hello")
Song.create_by_name("Hotline Bling")
