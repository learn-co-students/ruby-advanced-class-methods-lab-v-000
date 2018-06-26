
require 'pry'



class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
#     if self.find_by_name(name) if this is true
#  self.find_by_name(name) then return the value of this method
#   else
# self.create_by_name(name) if
#   end
end

def self.alphabetical
  @@all.uniq.sort_by {|song| song.name}
end

def self.new_from_filename(file)
# song equals to self.create
# split argument at "-" and equals to song_array
# chomp .mp3 from song_array at index 1 and equal to song_name
# song.name equals to string song_name
# song.artist_name equals to song_array at index 0
# return song
  song = Song.new
  song_array = file.split(" - ")
  song_name = song_array[1].chomp(".mp3")
  song.name = song_name
  song.artist_name = song_array[0]
  song
end


def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save
end

def self.destroy_all
  @@all.clear
end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
