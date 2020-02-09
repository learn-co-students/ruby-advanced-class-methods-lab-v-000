# song.rb
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
    song = self.new #could also use song = Song.new for this line
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new     # instantiates song
    song.name = name    # w/ name property
    song
  end

  def self.create_by_name(name)
    song = self.create  # instantiates & saves song
    song.name = name    # w/ name property
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}   #find a song by name in @@all
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #invokes .find_by_name & .create_by_name instead of repeating code
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}          #returns all song instances in alphabetical order by song name
  end

  def self.new_from_filename(filename)        #initializes a song and artist_name based on filename format
    file = filename.chomp(".mp3").split(' - ')
    artist_name = file[0]
    song_name = file[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)      # initializes and saves a song and artist_name based on filename format
  end

  def self.destroy_all
    self.all.clear       # clears all song instances from @@all array
  end
end
