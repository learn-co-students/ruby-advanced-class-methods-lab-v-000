class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self #Song.all << self
  end

  def self.create #Song.create
    song = self.new #creating variable song equal to Song.new
    song.save #saving
    song #returning our newly created song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name #sets our attr_accessor name to passed in argument
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #"Taylor Swift - Blank Space.mp3"
    components = filename.split(" - ") #["Taylor Swift", "Blank Space.mp3"]
    artist_name = components[0] #variable set to ["Taylor Swift"]
    name = components[1].gsub(".mp3", "") #variable set to ["Blank Space.mp3"], and substituites the .mp3 with ""

    song = self.new #vairbale set to new class instance
    song.artist_name = artist_name #instance set to artist_name (components[0])
    song.name = name #instance set to name (components[1])
    song

  end

  def self.create_from_filename(filename)
    components = filename.split(" - ")
    artist_name = components[0]
    name = components[1].gsub(".mp3", "")

    song = self.create
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
