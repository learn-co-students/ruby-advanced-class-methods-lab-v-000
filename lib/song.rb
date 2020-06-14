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
    song 
  end 
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song 
    song 
  end 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    parsed = filename.split(" - ") 
    song.artist_name = parsed[0]
    song.name = parsed[1].chomp(".mp3")
    song 
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
end
