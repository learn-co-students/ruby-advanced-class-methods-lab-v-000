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
    @@all << song
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
    @@all << song
    song
  end
    
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    
    if 
      find_by_name(name) != nil 
      find_by_name(name)
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}.uniq
  end
  
  def self.new_from_filename(file_name)
    
  end
  
end
