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
    @@all.detect{ |s| s.name == name }
  end 
    
    def self.find_or_create_by_name(name)
      if song = self.find_by_name(name)
        song 
      else 
        song = self.create_by_name(name)
        song 
      end 
    end 
    
    def self.alphabetical
      @@all.sort_by! { |s| s.name }
    end 
    
    def self.new_from_filename(filename)
      file = filename.split(" - ")
      artist = file[0]
      title = file[1].gsub(".mp3", "")
      
      song = new_by_name(title)
      song.artist_name = artist
      song
    end 
    
    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      @@all << song 
      song 
    end 
    
    def self.destroy_all
      self.all.clear
    end

end
