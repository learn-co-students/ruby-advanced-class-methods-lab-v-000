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

def self.create_by_name(string_name_of_the_song)
  song = self.new
  song.name = string_name_of_the_song
  @@all << song
  @@all.uniq
  song
end

def self.find_by_name(string_name_of_the_song)
  @@all.detect {|song| song.name == string_name_of_the_song}
end

def self.new_by_name(string_name_of_the_song)
  song = self.new
  song.name = string_name_of_the_song
  @@all << song
  song
end

def self.find_or_create_by_name(song)
  found_song = self.find_by_name(song)
  #binding.pry
  if found_song == nil
    self.create_by_name(song)
  else
    return found_song
  end
end

def self.alphabetical
  self.all.sort_by {|x| x.name}
end

def self.new_from_filename(mp3_formatted_file)
  song = self.new
  song.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
  song.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  song
end

def self.create_from_filename(mp3_formatted_file)
  song = self.new
  song.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
  song.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  song.save
end

def self.destroy_all
  self.all.clear
end
end
