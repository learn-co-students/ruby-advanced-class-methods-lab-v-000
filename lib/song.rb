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
    @song = self.new
    @@all << @song
    @song
end

def self.new_by_name(name)
  @song = self.new
  @song.name = name
  @song.save
  @song
end

def self.create_by_name(name)
  @song = self.new
  @song.name = name
  @song.save
  @song
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name}
end
def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  self.all.sort_by{ |song| song.name}
end

def self.new_from_filename(file)
  file_array = file.split(" - ") # here we get the artist and song name as two different elements ["artist", "song.mp3"]
  song_name = file_array[1].gsub('.mp3', '') # here we get the song name (string) and remove the .mp3
  # what do we need in order to be able to use the song name ? An instance object
  song = Song.new
  song.name = song_name # song.name << "For Love I come", think about the setter method of name
  song.artist_name = file_array[0]
  song
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save
  song
end

def self.destroy_all
  self.all.clear
end
end
