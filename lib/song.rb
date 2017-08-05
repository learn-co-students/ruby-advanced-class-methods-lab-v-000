class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def Song.create
    song = self.new
    @@all << song
    song
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

def Song.find_by_name(name)
 @@all.find { |song| song.name == name }
end

def Song.find_or_create_by_name(name)
  if Song.find_by_name(name) == nil
    Song.create_by_name(name)
  else Song.find_by_name(name)
   end
end

def Song.alphabetical
  @@all.sort_by! { |song| song.name }
end

def Song.new_from_filename(file_name)
data = file_name.split("-")
artist_name = data[0].strip
title = data[1].strip.split(".")
name = title[0]
song = Song.new
song.name = name
song.artist_name = artist_name
song
end

def Song.create_from_filename(file_name)
  data = file_name.split("-")
  artist_name = data[0].strip
  title = data[1].strip.split(".")
  name = title[0]
  song = Song.new
  song.name = name
  song.artist_name = artist_name
  @@all << song
  song
end

def Song.destroy_all
 @@all.clear
end


end
