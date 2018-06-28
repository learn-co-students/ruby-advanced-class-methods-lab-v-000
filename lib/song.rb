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
    @@all << song
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find{ |i| i.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else 
      new_song = create_by_name(song_name)
      new_song
    end
  end

  def self.alphabetical
    self.all.sort_by {|i| i.name}
  end
  
 def self.new_from_filename(file_name)
    new_song = self.new 
    new_song.artist_name = file_name.split(/( - )|(.mp3)/)[0]
    new_song.name = file_name.split(/( - )|(.mp3)/)[2]
    new_song
  end 

  
  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    new_song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
