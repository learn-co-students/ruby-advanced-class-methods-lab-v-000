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
    song
  end

def self.new_by_name(song_name)
  song = self.new
  @name= song_name
  song.name = song_name
  song
end

def self.create_by_name(song_name)
song = self.create
song.name= song_name
song
end

def self.find_by_name(song_name)
  @@all.detect{|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)

    self.find_by_name(song_name) ||
     self.create_by_name(song_name)

end

def self.alphabetical
  self.all.sort_by{|s| s.name}

end

def self.new_from_filename(filename)
  #take in argument of file format
  song = self.new
  filename_split = filename.split(" - ") #["Thunderbird", "For love I come.mp3"]
  song_name = filename_split[1].split(".") #["For love I come", "mp3"]
  song.name = song_name[0]
  song.artist_name = filename_split[0]

  song
  #split file_name at "-" and separate it into artist_name and song_name
  #delete .mp3
  #return artist_name
  #return song_name

end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save

  #takes in filename as argument
end


def self.destroy_all
  self.all.clear
end


end
