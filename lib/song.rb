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
    song = self.create
    song.name = name 
    song
  end 
  
  def self.find_by_name(name) 
    self.all.find {|x| x.name == name}
  end
  
def self.find_or_create_by_name(name)
  search = self.find_by_name(name)
  if search == nil
  self.create_by_name(name)
  else search
end
end

def self.alphabetical
  self.all.sort_by { |x| x.name}
end 

def self.new_from_filename(file)
  constructor = self.new 
  constructor.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
  constructor.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  constructor
end

def self.create_from_filename(file)
  constructor = self.new 
  constructor.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
  constructor.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
  constructor.save
  constructor
end

def self.destroy_all
  self.all.clear
end

end