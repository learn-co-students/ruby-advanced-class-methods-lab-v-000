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

  def self.create
    song = self.new  # initializes song
    self.all << song  # you can also save the song instance with the #save method, i.e. song.save
    #binding.pry
    song  # returns => "#<Song:0x00000001c7f3c0>", song instance that was created
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name  # assign song name
    #binding.pry
    song  # returns => #<Song:0x00000001597030 @name="Bring the Rain">
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name  # assign song name
    song.save  # you can also save the song with the shovel method, i.e. self.all << song
    #binding.pry
    song  # returns => #<Song:0x00000001718198 @name="Keep Making Me">
  end

  def self.find_by_name(name)
    match_song = self.all.find do |song|  # #detect or #find method will only return the first element that makes the block true
      song.name == name
      #binding.pry
    end
    match_song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    sorted_array = self.all.sort_by do |song|  # iterate and sort array by song.name
      song.name
    end
    sorted_array
    #binding.pry
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"  # deletes a specific portion of the string
    array = filename.split(" - ")  # removed dash and spaces and returns comma separated array
    artist_name = array[0]  # artist_name name is at index 0
    name = array[1]  # song is at index 1
    song = self.new  # create instance of song before adding artist_name and song name
    song.artist_name = artist_name  # assign artist_name
    song.name = name  # assign song name
    song  # returns => #<Song:0x000000017d6ee0 @artist_name="Casting Crowns", @name="At Your Feet">
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song  # shovels new artist_name and song name into array @@all
    #binding.pry
    song  # returns => #<Song:0x000000017d6ee0 @artist_name="Casting Crowns", @name="At Your Feet">
  end

  def self.destroy_all
    self.all.clear  # clears all the song instances from the @@all array
  end

end


#song = Song.create
#song = Song.new_by_name("Bring the Rain")
keep_making_me = Song.create_by_name("Keep Making Me")
bring_the_rain = Song.create_by_name("Bring the Rain")
creed = Song.create_by_name("Creed")
Song.find_by_name("Creed")
Song.alphabetical
song = Song.new_from_filename("Casting Crowns - At Your Feet.mp3")
Song.create_from_filename("Casting Crowns - At Your Feet.mp3")
