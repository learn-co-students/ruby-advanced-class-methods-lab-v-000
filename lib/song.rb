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

 def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

 def self.create_by_name(name)
  song = self.new
  song.name = name
  song.save
  song
end

 def self.find_by_name(name)
  self.all.detect do |song|
    song.name == name
  end
end

 def self.find_or_create_by_name(name)
  dupe = Song.find_by_name(name)
  if dupe == nil
    Song.create_by_name(name)
  else
    dupe
  end
end

 def self.alphabetical
  self.all.sort_by do |song|
    song.name
  end
end

 def self.new_from_filename(filename)
  array = filename.split(/[^a-zA-Z\s]|\s-\s/)
  song = self.new
  song.name = array[1]
  song.artist_name = array[0]
  song
end

 def self.create_from_filename(filename)
  array = filename.split(/[^a-zA-Z\s]|\s-\s/)
  song = self.new
  song.name = array[1]
  song.artist_name = array[0]
  song.save
  song
end

 def self.destroy_all
  self.all.clear
end

end
