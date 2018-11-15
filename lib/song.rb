class Song
  attr_accessor :name, :artist_name
  @@all = []

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
def self.find_by_name

end

# class end below
end
