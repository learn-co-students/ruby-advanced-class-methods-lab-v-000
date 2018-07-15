require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #why do you need the .class next to the self? why can't you just go @all << self?
    self.class.all << self
  end


  def self.create
    this_song = Song.new
    this_song.save
    return this_song

  end


  def self.new_by_name(song_name)
    this_song = Song.new
    this_song.name = song_name
    return this_song

  end


  def self.create_by_name(song_name)
    this_song = Song.new
    this_song.name = song_name
    this_song.save
    return this_song
  end


  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end


  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
      if found_song != nil
        found_song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

#Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space and the artist_name set to Taylor Swift.
#The filename input sent to Song.new_from_filename = argument
#Separate the artist name from the rest of the data based on the - delimiter.
#Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.

  def self.new_from_filename(file_name)
    this_song = Song.new
    split_array = file_name.chomp('.mp3').split (" - ")
    this_song.artist_name= split_array[0]
    this_song.name= split_array[1]
    return this_song
  end


  def self.create_from_filename(file_name)
     new_song = self.new_from_filename(file_name)
     new_song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
