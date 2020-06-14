require 'pry'

class Song
  attr_accessor :name, :artist_name #Reader and writers
  @@all = [] #@@all the songs in an array

  def self.all #Class Reader
    @@all
  end

  def save
    self.class.all << self #Adds song object to @@all array
  end

  def self.create #Custom constructor
    song = self.new #Instantites an object
    song.save #Saving the song using .save method
    song #Returning new song
  end

  def self.new_by_name(song_name) #Class constructor
    song = self.new #Instantites an object
    song.name = song_name #Giving it a name
    song #Returning new song
  end

  def self.create_by_name(song_name) #Class constructor
    song = self.new #Instantites an object
    song.name = song_name #Giving it a name
    song.save #Saving the song using .save method
    song #Returning new song
  end

  def self.find_by_name(song_name) #Class constructor
    self.all.detect{|song| song.name == song_name} #Itterate through array to find the equivilant song name
  end

  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else
      Song.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by!{ |song| song.name}
  end

  def self.new_from_filename(filename) #"Thundercat - For Love I Come.mp3"
    song_file = filename.split(" - ") #Split artist and song
    artist_name = song_file[0] #save artist name seperatly
    song_name = song_file[1].chomp('.mp3') #save song name seperatly and get rid of .mp3

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_file = filename.split(" - ") #Split artist and song
    artist_name = song_file[0] #save artist name seperatly
    song_name = song_file[1].chomp('.mp3') #save song name seperatly and get rid of .mp3

    song = self.new
    song.save
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end
end
