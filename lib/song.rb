class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create #instantiates a new song, saves it, and returns it
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name) #instantiates a new song but does not save it
    song = self.new
    song.name = name
    song
  end

  def self.new_from_filename(filename) #instantiates a new song from a given filename
    song = self.new
    song.name = filename.split(/[-\.]/)[1].strip
    song.artist_name = filename.split(/[-\.]/)[0].strip
    song
  end

  def self.create_from_filename(filename) #instantiates and saves a new song from a given filename
    song = self.new
    song.name = filename.split(/[-\.]/)[1].strip
    song.artist_name = filename.split(/[-\.]/)[0].strip
    song.save
    song
  end

  def self.create_by_name(name) #instantiates a new song, saves it, and returns it
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name) #detects whether or not the song provided is present
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name) #creates a new song if there isnt a match found
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical #sorts the class variable by song name in alphabetical order
    @@all.sort_by {|song| song.name}
  end

  def self.all #class method to show all existing songs/artist names
    @@all
  end

  def save #allows each instance to save to the class variable
    self.class.all << self
  end

  def self.destroy_all #allows a user to clear out the list if needed
    self.all.clear
  end
end
