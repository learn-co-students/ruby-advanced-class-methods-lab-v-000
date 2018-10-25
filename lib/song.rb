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
    x = Song.new
    @@all << x
    x
  end 
  
  def self.new_by_name(name)
    x = Song.new 
    x.name = name 
    x
  end 
  
  def self.create_by_name(name) 
    x = Song.new 
    x.name = name 
    @@all << x 
    x 
  end 
  
  def self.find_by_name(name)
    if Song.all.find{|song| song.name == name}
      Song.all.find{|song| song.name == name}
    else 
    nil 
    end
  end   
  
  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical 
   @@all.sort_by{|obj| obj.name}
  end 
  
  def self.new_from_filename(file)
    x = Song.new 
    a = file.split(" - ")
    x.artist_name = a[0] 
    b = a[1].split(".")
    x.name = b[0]
    x
  end
  
  def self.create_from_filename(file)
    x = Song.new 
    x.save
    a = file.split(" - ")
    x.artist_name = a[0] 
    b = a[1].split(".")
    x.name = b[0]
    x
  end   
  
  def self.destroy_all
    @@all = []
  end 
end
