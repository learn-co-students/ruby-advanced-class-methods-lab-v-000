class Song
  attr_accessor :name, :artist_name
  @@all = [] #class variable to hold all songs

  def self.all #class getter method
    @@all
  end

  def save #instance method to save itself into the class variable @@all
    self.class.all << self
  end

  def self.create #class method to custom construct a new song and save itself
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name) #class method to custom construct a new song and give it the property name
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name) #class method to custom construct, save, create name property, and return song
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)#class method to detect and return the song if the song exists in the class variable.
    self.all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(filename)
    data = filename.slice(0,filename.length-4).split(" - ")
    artist_name = data[0]
    song_name = data[1]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
