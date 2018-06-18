class Song
  attr_accessor :name, :artist_name, :song 
  @@all = []
  
  def initialize(name=nil, artist_name=nil)
    @name = name 
    @artist_name = artist_name
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
new_song = self.new
new_song.save
new_song 
  end 

def self.new_by_name(name)
song = self.new(name)
end 

def self.create_by_name(name)
song = self.new(name)
song.save 
song 
end 

def self.find_by_name(name)
  @@all.find do |record|
    record.name == name 
  end 
end 

def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil || self.find_by_name(name)== false 
 self.create_by_name(name) 
 else 
   return self.find_by_name(name)
end
end 

def self.alphabetical
 self.all.sort_by! do |song|
    song.name 
  end 
  @@all 
end 
 
def self.new_from_filename(filename)
array=[]
array = filename.split("-")
artist_name = array[0].strip
song_name = array[1].gsub(".mp3","").strip 
self.new(song_name,artist_name)
 
end 

def self.create_from_filename(filename)
array=[]
array = filename.split("-")
artist_name = array[0].strip
song_name = array[1].gsub(".mp3","").strip
self.new(song_name,artist_name).save
end 

def self.destroy_all
  self.all.clear
end 
end 
