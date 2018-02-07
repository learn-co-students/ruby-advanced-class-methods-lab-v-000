require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end
#instantiates and saves the song, and it returns the new song that was created
def self.create
song = self.new
@@all << song
song
end



#instantiates a song with a name property
def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end


def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
  end

def self.find_by_name(name)
  @@all.detect {|c| c.name == name}
end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create_by_name(name)
end


def self.new_from_filename(filename)
  result = filename.split(" - ")
  artist_name = result[0]
  song_name = result[1].gsub(".mp3", "")
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
song
end

def self.create_from_filename(filename)
  i = self.new_from_filename(filename)
  @@all << i
end

def self.alphabetical
@@all.sort_by {|obj| obj.name}
end


def self.destroy_all
  self.all.clear
end

end
