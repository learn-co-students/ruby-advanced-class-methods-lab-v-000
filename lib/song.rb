require 'pry'

class Song
  attr_accessor :name, :artist_name

  # store all instances of Song created by instance method Song#save
  @@all = []

  def self.all
    # puts "I am in class method self.all. self is: #{self.class}"
    @@all
  end


  def save
    # why is this included in the lab...what should I have used it for???
    # here self refers to a specific song
    # so we need to call self.class to get to the class method #all
    # puts "I am in instance method save. self is: #{self.class}"
    self.class.all << self
  end


  # class constructor: initialize a song and save it to the @@all class variable either literally or through the class method Song.all. Should return the song instance that was initialized and saved.
  def self.create
    song = self.new
    self.all << song
    song
  end


  # class constructor: take in the string name of a song and return a song instance with that name set as its name property. Should return an instance of Song and not a simple string.
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end


  # class constructor: take in the string name of a song and return a song instance with that name set as its name property and the song being saved into the @@all class variable.
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end


  # class constructor: accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". must be parsed for the relevant components. Seperate the artist name from the rest of the data based on the - delimiter. Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.
  def self.new_from_filename(song_filename)
    artist = song_filename.split(/\s-\s/).first
    filename = song_filename.split(/\s-\s/).last
    song_title = filename.split(/\..{3}/).first

    song = self.new
    song.name = song_title
    song.artist_name = artist
    song
  end

  # class constructor: accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.
  def self.create_from_filename(song_filename)
    song = new_from_filename(song_filename)
    self.all << song
    song
  end


  # accept the string name of a song and return the matching instance of the song with that name.
  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name }
  end


  # accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name).nil? ? self.create_by_name(song_name) : find_by_name(song_name)
  end


  # return all the songs in ascending (a-z) order.
  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end


  # reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
  def self.destroy_all
    self.all.clear
  end


end

# Song.create
# Song.create_by_name('Song.new_by_name Santeria')
# Song.create_by_name('Song.new_by_name Blank Spaces')
# Song.create_by_name('Song.new_by_name Thriller')
# Song.new_from_filename('Song.new_from_filename Sublime - Santeria.mp3')
# Song.new_from_filename('Song.new_from_filename Taylor Swift - Blank Spaces.mp3')
# Song.new_from_filename('Song.new_from_filename Michael Jackson - Thriller.mp3')
# Song.new_from_filename('Thundercat - For Love I Come.mp3')
# return_val = Song.find_by_name('Song.new_by_name Santeria')
# return_val2 = Song.find_by_name('not a song')
# p return_val #=> #<Song:0x00000002d1a838 @name="Song.new_by_name Santeria">
# p return_val2 #=> nil
#binding.pry

#'Song.create Thriller'









=begin





=end
