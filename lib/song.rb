class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name = "", artist = "")
    @name = name 
  end 

  def save
    self.class.all << self
  end

  def self.create 
    song = new 
    @@all << song 
    song 
  end 
  
  def self.new_by_name(name)
    new(name) 
  end 
  
  def self.create_by_name(name)
    @@all << new(name)
    @@all.last
  end 
  
  def self.find_by_name(name)
    @@all.detect {|each| each.name == name}
end

def self.find_or_create_by_name(name)
  if find_by_name(name)
    find_by_name(name)
  else 
    create_by_name(name)
  end 
end

def self.new_from_filename(file)
  file = file.split(".")[0]
  data = file.split(" - ")
  song = new 
  song.artist_name = data[0]
  song.name = data[1]
  song 
end 

def self.create_from_filename(file)
  song = new_from_filename(file)
  @@all << song 
  @@all.last
end 

def self.alphabetical 
  @@all.sort{|a,b| a.name <=> b.name}
end 

def self.destroy_all 
  @@all = []
end 

end 