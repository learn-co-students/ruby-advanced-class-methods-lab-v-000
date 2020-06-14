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

  def self.new_by_name(name)
    song = self.new 
    song.name = name
    return song 
end

def self.create_by_name(name)
  song = self.new 
  song.name = name
  
  @@all << song
  
  return song 
  
end 

def self.find_by_name(name)
   self.all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  song_name = self.find_by_name(name)
  
  if song_name 
    return song_name
  else 
    self.create_by_name(name)
end
end 

def self.alphabetical
  @@all.sort_by{|song| song.name }
end 

def self.new_from_filename(filename)
 parts = filename.split(" - ")
 artist_name = parts[0]
 song_name = parts[1].slice(0..-5)
 
 song = self.new 
 song.name = song_name
 song.artist_name = artist_name
 
 song 
end 

def self.create_from_filename(filename)
  parts = filename.split(" - ")
 artist_name = parts[0]
 song_name = parts[1].slice(0..-5)
 
 song = self.new 
 song.name = song_name
 song.artist_name = artist_name
 
 @@all << song 
end

def self.destroy_all 
  self.all.clear
end

end
