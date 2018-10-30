class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
   song = self.new 
   song.name = name
   @@all << song
   song
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else self.create_by_name(name)
    end 
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    artist = file[0]
    title = file[1]
    song=self.new
    song.artist_name = artist
    song.name=title
    song 
  end
    
  def self.create_from_filename(filename)
     @@all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
    
  def save
    self.class.all << self
  end
end
