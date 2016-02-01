require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #initializes a song and saves it to @@all literally or through class method Song.all
  #should return song instance that initialized and saved
  def self.create
    song = self.new
    @@all << song
    song
  end

  #takes in the string name of a song and returns a song instance with that name set as its name property. 
  #Song.new_by_name should return an instance of Song and not a simple string or anything else.
  def self.new_by_name(name)
    @name = name
    song = self.new
    song.name = name
    song
  end

  #takes in the string name of a song and returns a song instance with that name set as its 
  #name property and the song being saved into the @@all class variable.
  def self.create_by_name(name)
    @name = name
    song = self.new
    song.name = name
    @@all << song
    song  
  end

  #accepts the string name of a song and returns the matching instance of the song with that name.
  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end

  #accept a string name for a song and either return a matching song instance with that name or 
  #create a new song with the name and return the song instance.
  def self.find_or_create_by_name(name)
    if @@all.detect {|s| s.name == name} == nil then
      @name = name
      song = self.new
      song.name = name
      @@all << song
      song  
    else
      @@all.detect {|s| s.name == name}
    end
  end

  #returns all the songs in ascending (a-z) alphabetical order
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  #Build a class constructor that accepts a filename in the format of " - .mp3", 
  #for example "Taylor Swift - Blank Space.mp3".
  def self.new_from_filename(file)
    split1 = file.split(' - ')
    artist_name = split1[0]
    song_mp3 = split1[1]
    song_name_split = song_mp3.split('.')
    song_name = song_name_split[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  #parse the filename correctly but should also save the Song instance that was created
  def self.create_from_filename(file)
    split1 = file.split(' - ')
    artist_name = split1[0]
    song_mp3 = split1[1]
    song_name_split = song_mp3.split('.')
    song_name = song_name_split[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song
  end

  #reset the state of the @@all class variable to an empty array thereby 
  #deleting all previous song instances
  def self.destroy_all
    @@all.clear
  end



end