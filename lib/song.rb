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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(name_of_song)
    @@all.find {|s| s.name == name_of_song}  
  end

  def self.find_or_create_by_name(song_name)
    if @@all.include?(song_name)
      song_name
    else
      create_by_name(song_name)
    end
  end  

  def self.alphabetical
      @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(file_name)
    break_file_name = file_name.split(" - ")
    artist_name = break_file_name[0]
    song_names = break_file_name[1].split(".")
    song_name = song_names[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
     break_file_name = file_name.split(" - ")
     artist_name = break_file_name[0]
     song_names = break_file_name[1].split(".")
     song_name = song_names[0]
     
     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song.save
     song
  end

  def self.destroy_all
    @@all.clear
  end

end
