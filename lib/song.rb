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
    song = self.new 
    @@all << song
    return song
  end
  
  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end  
  
  def Song.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.alphabetical
    @@all.sort_by(&:name)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.find_by_name(name)
    @@all.find do | song_name|
      song_name.name == name
    end
  end
  
  def Song.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end
  
  def self.new_from_filename(file)
    new_song = file.split(" - ")
    artist_name = new_song[0]
    song_name = new_song[1].chomp('.mp3')
    song = self.new
    song.name = song_name 
    song.artist_name = artist_name
    song
end

  def Song.create_from_filename(file)
    new_song = file.split(" - ")
    artist_name = new_song[0]
    song_name = new_song[1].chomp('.mp3')
    song = self.new
    song.name = song_name 
    song.artist_name = artist_name
    @@all << song
    song
  end

end