class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
    song= self.new 
   @@all<< song 
   return song 
 end 
 
 def Song.new_by_name(name)
   song = self.new 
   song.name = name 
   return song   
 end
 
 def Song.create_by_name(name)
 song = self.create 
 song.name = name 
 song 
 end 
 
 def Song.find_by_name(name)
   @@all.detect{|s| s.name == name } 
 end 

def Song.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end

def Song.alphabetical
  self.all.sort_by{|s| s.name }
end 
  
  def Song.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name= parts[1].gsub(".mp3","")
    
    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name 
    song 
  end 
  
  def Song.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
    song = self.create
    song.artist_name = artist_name 
    song.name = song_name 
    song 
  end 
    
    def Song.destroy_all 
      @@all.clear
    end 
  
end
