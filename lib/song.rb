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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    # song.save
    song
  end
  
  def self.find_by_name(name)
    output = nil
    @@all.each { |n| 
      if n.name == name
        output = n
      end
    }
    output
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    elsif self.find_by_name(name) != nil
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by! { |n| n.name }
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    subarray = array[1].split('.')
    
    song = self.new_by_name(subarray[0])
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(filename)
    array = filename.split(" - ")
    subarray = array[1].split('.')
    
    song = self.create
    song.name = subarray[0]
    song.artist_name = array[0]
    song
  end
  
  def self.destroy_all
    @@all = []
  end
end

