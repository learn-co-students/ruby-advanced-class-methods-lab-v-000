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
  
  def self.new_by_name(songName)
    song = self.new
    song.name = songName
    song
  end
  
  def self.create_by_name(songName)
    song = self.create  
    song.name = songName
    song
  end
  
  def self.find_by_name(songName)
    self.all.detect {|song| song.name == songName}
  end
  
  def self.find_or_create_by_name(songName)
    find_by_name(songName) || create_by_name(songName)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = title[0]
    songName, extension = title[1].split(".")
    song = self.new 
    song.artist_name = artist
    song.name = songName
    song
  end
  
  def self.create_from_filename(filename)
    title = filename.split(" - ")
    artist = title[0]
    songName, extension = title[1].split(".")
    song = self.create 
    song.artist_name = artist
    song.name = songName
    song
  end
  
  def self.destroy_all
    @@all.clear
  end

end
