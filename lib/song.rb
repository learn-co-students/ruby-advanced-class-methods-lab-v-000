class Song
  attr_accessor :name, :artist_name, :song

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
    return song
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
    self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
  self.all.detect {|song| song.name == name}
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  
  
 

end
