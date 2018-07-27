class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    new_song = self.new
    new_song.save
    new_song
  end 
  
  def self.new_by_name(name)
    new = self.new
    new.name = name
    new 
  end 
  
  def self.create_by_name(name)
    new = self.new
    new.name = name
    @@all << new 
    new
  end 
  
  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by { |name| name.name}
  end 
    
  def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
end 

  
  def self.create_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
end 

def self.destroy_all
  @@all = []
end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
