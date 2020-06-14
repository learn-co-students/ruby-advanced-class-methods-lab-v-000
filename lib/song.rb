'require pry'

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
    @@all << song
    song
  end

  def self.new_by_name(song_string)

  new_song = self.new
  new_song.name = song_string
  new_song 
  end

  def self.create_by_name(string_name)

  new_song = self.new
  new_song.name = string_name
  @@all <<  new_song
  new_song
  end

  def self.find_by_name(string)

  self.all.detect {|song| song.name == string}

  end

  def self.find_or_create_by_name(string)

  self.find_by_name(string) || self.create_by_name(string)

  end

  def self.alphabetical

   self.all.sort_by {|song|song.name }

  end

  def self.new_from_filename(song_file)

  artist_song = song_file.split(".mp3")
  artist_song_string = artist_song.join(" ")
  artist_array = artist_song_string.split(" - ")
  artist = artist_array[0]
  song_name = artist_array[1]

  song = Song.new
  song.name = song_name
  song.artist_name = artist
  song

  end

  def self.create_from_filename(song_file)
  
  artist_song = song_file.split(".mp3")
  artist_song_string = artist_song.join(" ")
  artist_array = artist_song_string.split(" - ")
  artist = artist_array[0]
  song_name = artist_array[1]

  song = Song.new
  song.name = song_name
  song.artist_name = artist
  @@all << song

  end

  def self.destroy_all
    @@all.clear

  end



end
