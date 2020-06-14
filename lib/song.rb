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
  song.save 
  return song 
end


def self.new_by_name(name)
  song = Song.new 
  song.name = name 
  song 
  end 

def self.create_by_name(name) 
  song = Song.create 
  song.name = name 
  song.save  
  song 
end 

def self.find_by_name(name) 
  @@all.find.each do |song| 
    song.name == name 
  end 
end 

def self.find_or_create_by_name(name)
   song = self.find_by_name(name)
    song.nil? ? self.create_by_name(name) : song
  end

def self.alphabetical
  self.all.uniq.sort_by{|song| song.name}
end 


def self.new_from_filename(filename) 
    a = filename 
    b = a.split(" - ")
    artist_name = b[0]
    song_name = b[1].gsub(".mp3","")
    
    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name 
    song 
  end 
    
def self.create_from_filename(data)
data_info =  data.gsub(".mp3","").split(" - ")
music = self.create_by_name(data_info[1])
music.artist_name = data_info[0]
end 

def self.destroy_all 
  @@all.clear 
  
end 



end 
