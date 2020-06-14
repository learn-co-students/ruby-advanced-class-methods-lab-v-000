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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
   def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    @@all.detect { | song | song.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    @@all.sort_by { | word | word.name }
  end
  
  def self.new_from_filename(song_name)
    artist_song_array = song_name.split(" - ")
    artist = artist_song_array[0]
    song = artist_song_array[1].gsub(".mp3", "" )
    
    chanson = self.new_by_name(song)
    chanson.artist_name = artist
    chanson
  end
  
  def self.create_from_filename(song_name)
    artist_song_array = song_name.split(" - ")
    artist = artist_song_array[0]
    song = artist_song_array[1].gsub(".mp3", "" )
    
    chanson = self.create_by_name(song)
    chanson.artist_name = artist
    chanson
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
