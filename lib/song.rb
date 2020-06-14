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
  
  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end 
  
  def self.create_by_name(song) 
    new_song = self.new 
    new_song.name = song 
    @@all << new_song 
    new_song
  end 
  
  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by { |song_name| song_name.name }
  end 
  
  def self.new_from_filename(filename_string)
    filename_array = filename_string.split(" - ")
    artist_name = filename_array[0]
    song_name = filename_array[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename_string)
    song = self.new_from_filename(filename_string)
    @@all << song 
  end 
  
  def self.destroy_all
    @@all.clear
  end 

end
