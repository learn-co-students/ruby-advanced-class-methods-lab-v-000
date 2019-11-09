class Song
#Song instances have basic properties of a name and an artist name.
  attr_accessor :name, :artist_name
#store all instances in [] for Song that are
#created through the instance method Song#save
  @@all = []

  def self.all
    @@all
  end

#saves all the instances and stores them
  def save
    self.class.all << self
  end

#new instance of a song which is stored then to save (song.save)
  def self.create
    song = Song.new
    song.save
    song
  end

#takes in the string name of a song and returns a song instance
#with that name set as its name property
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

#takes in the string name of a song and returns a song instance with
#that name set as its name property and the song being saved into
#the @@all class variable.
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

#accepts the string name of a song and returns the matching instance
#of the song with that name
  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

#uses already created methods of find_by_name and
#create_by_name
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

#returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

#class constructor that accepts a filename in the format of " - .mp3"
#initializes a song and artist_name based on the filename format
#Returns a copy of str with the all occurrences of pattern substituted
#for the second argument
  def self.new_from_filename(filename)
#separating artist from rest of the data using " - "
    parts = filename.split(" - ")
#first part of array is artist name
    artist_name = parts[0]
#second part is song name with .mp3 removed
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

#initializes and saves a song and artist_name based on the
#filename format. Same as above method, only "create" instead of "new".
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

#clears all the song instances from the @@all array
    def self.destroy_all
      self.all.clear
    end


end
