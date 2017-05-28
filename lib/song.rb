  class Song
  attr_accessor :name, :artist_name
  @@all = []

#  def initialize(name, artist_name)
#    @artist_name = artist_nam  end

  def self.all
    @@all #returns all elements in array
  end

  def save
    self.class.all << self #pushes 'this instance' of Song to the entire Class of Self(Song)
  end

  def self.create
    song = self.new #instantiate snew song
    song.save #save song using save class method which pushes instance to .all array of elements
    song #return song
  end

  def self.new_by_name(name) #taking in string name of song
    song = self.new #instantiates new song
    song.name = name #set name os the new object to name
    song #returns the song
  end

  def self.create_by_name(name)
    song = self.new #instantiates new song
    song.name = name #assign name property
    song.save #saves song via save class method
    song #returns the song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
    #use self.all method to refer to ENTIRE class.
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ") #split filename
    song_title = song_info[1].split(".") #split song title
    song = self.find_or_create_by_name(song_title[0]) #send song title to class method
    song.artist_name = song_info[0] #set artist_name
    song #return song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
