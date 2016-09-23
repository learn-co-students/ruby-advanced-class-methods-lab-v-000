class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #Initializes a new song and adds it to the @@all variable
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name) #Initializes a new song by the name
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name) #initializes a new song with name, and adds it to the @@all variable
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name) #Searches for the song in the current database if it exists
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name) #Creates a new song only if it currently does not exist in the @@all
    self.all.include?(self.name) ? self : self.create_by_name(name)
  end

  def self.alphabetical #Sort all the songs in @@all alphabetically by their name value
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename) #Initialize a new song by file name, by splitting it
    data = filename.split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename) #Initialize a new song by file name, and store it in @@all
    data = filename.split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1].chomp(".mp3")
    self.all << song
    song
  end

  def self.destroy_all #Clear all the data from the @@all class variable
    self.all.clear
  end

end
