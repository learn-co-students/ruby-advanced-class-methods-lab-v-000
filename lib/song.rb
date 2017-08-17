require "pry"

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
    song = self.new
    song.save
    song
  end

  #instantiates a new instance of the Song class
  #song = Song.new_by_name("Happy")
  #Makes the argument of song_name equal to the name method in the attr_accessor
  #so that when I call song.name, I get "Happy".
  #returns the song
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create #this method will create and save the song
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
    #since I have defined a class method #Song.all(which exposes the @@all array of songs), I can apply this method to the entire class using self.all; then I can use the enumerator #detect to return the first instance it finds that mataches the song name entered.
  end

  def self.find_or_create_by_name(song_name) #prevent duplicate songs from being created
    #should either return a matching song instance or create a new song and return the song.
    if Song.find_by_name(song_name)
      Song.find_by_name(song_name)
    else
      Song.create_by_name(song_name)
    end
    ##SOLUTION CODE: self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by!{|song| song.name }
  end

  def self.new_from_filename(filename)
    # filename.delete!(".mp3") actually deletes all occurances of the letter "m", therefore returning the song as "For Love I Coe" instead of "For Love I Come"
    artist_and_song = filename.split(" - ")
    artist_name = artist_and_song[0]
    song_name = artist_and_song[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
