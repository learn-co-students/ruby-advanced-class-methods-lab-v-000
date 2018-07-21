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
    song = Song.new
    song.save
    song
  end
 
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
      self.all.find{|title| title.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|title| title.name}
  end
  
  
  def self.new_from_filename(filename)
    # binding.pry
    array = filename.split(" - ")
    artist = array[0]
    song = self.new
    song.name = array[1].split(".mp3")[0]
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(filename)
   song = self.new_from_filename(filename)
   song.save
   song
  end
  
  def self.destroy_all
    self.all.clear
  end
end




