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
    song= self.new 
    song.name = name
    song 
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save
    song 
  end 
  
  def self.find_by_name(name)
    @@all.detect { |song| song.name == name  }
  end
  
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
  @@all.sort {|a,b| a.name <=> b.name }
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
      self.all.clear
      # @@all = []
      #@@all.clear
    end 
end
