require "pry"

 class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  #def intitialize(name)
   # @name = name
  #end

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
    @name = name
    song = self.new
    song.name = name
    #binding.pry
    @@all << song
    song
  end
  
  def self.create_by_name(name)
    @name = name
    song = self.new
    song.name = name
    #binding.pry
    @@all << song
    song
  end
  
   def self.find_by_name(name)
    self.all.find{|artist| artist.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil 
      self.find_by_name(name)
    else 
      #self.create_by_name(name)
      self.create_by_name(name)
      #binding.pry
    end
  end
  
  def self.alphabetical
    @@all.sort_by!{|s| s.name}
  end
  
  
  def self.new_from_filename(filename)
    
    artist_name = filename.split(' - ')[0]
    song_name = filename.split(' - ')
    name = song_name[1].split('.')[0]

    @artist_name = artist_name
    @name = name 
    
    song = self.new_by_name(name)
    
    song.artist_name = artist_name
    song
    #binding.pry
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
def  self.destroy_all
  @@all = []
end
end
