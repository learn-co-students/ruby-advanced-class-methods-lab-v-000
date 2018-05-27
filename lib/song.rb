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
  
  def self.find_by_name(song_name) 
    self.all.detect{|song| song.name == song_name} 
  end
  
  def self.find_or_create_by_name(name) 
     self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical 
    self.all.sort{|x,y| x.name <=> y.name} 
  end
  
  def self.new_from_filename(filename) 
    song = self.new
    split_array = filename.split(/ - |.mp3/) 
    song.artist_name = split_array[0]  
    song.name = split_array[1]
    song
  end
  
  def self.create_from_filename(filename) 
    self.new_from_filename(filename).save 
  end
  
  def self.destroy_all 
    self.all.clear 
  end
    


end
