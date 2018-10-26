require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

# binding.pry

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
 #   binding.pry
  end
  
  def self.new_by_name(name)
    song=Song.new
    song.name = name
    song
  end
 
  def self.create_by_name(name)
    song=Song.new
    song.name = name
    song.save
    song
  end
  # binding.pry
  
  def self.find_by_name(name)
    @@all.detect { |x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(filename)
    song = Song.new
    song.name=filename
  end
  
  
  
  
end
