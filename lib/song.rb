class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name) ###
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
        self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    song = self.create
    processedFile = filename.split(" - ")
    song.artist_name = processedFile[0]
    song.name = processedFile[1].chomp(".mp3")
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end
    
  def self.alphabetical
    self.all.sort_by{|song| song.name} 
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
