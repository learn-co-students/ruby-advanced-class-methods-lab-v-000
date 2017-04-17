class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


#instantiates and saves the song, and it returns the new song that was created  
  def self.create
  song = self.new
  song.save
  song
  end

#instantiates a song with a name property
  def self.new_by_name(name)
  song = self.new
  song.name = name
  song
  end

#instantiates and saves a song with a name property 
  def self.create_by_name(name)
  	song = self.create
  	song.name = name
  	song
  end

#can find a song present in @@all by name
  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

#creates a new song if one doesn't already exist. 
#finds song by name if song has already been created.
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

#returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

#initializes a song and artist_name based on the filename format
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song = self.new_by_name(filename[1].gsub(".mp3", ""))
    song.artist_name = filename[0]
    song
  end

#initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

#clears all the song instances from the @@all array
  def self.destroy_all
  	self.all.clear
  end
end
