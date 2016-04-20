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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

def self.create_by_name(name)
  saved_song = self.new
  saved_song.name = name
  @@all << saved_song
  saved_song
end

def self.find_by_name(name)
  @@all.detect{|song| song.name == name}
end
  
def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else 
    self.find_by_name(name)
  end
end

def self.alphabetical
 
  @@all.sort_by{|song|song.name}
   
end
 
 def self.new_from_filename(string)
  first = string.split(" - ") 
  second = first[1].split(".mp3")
  
  artist_name = first[0] 
  song_name = second[0]

  v = self.create_by_name(song_name)

  v.artist_name = artist_name

  v


end

def self.create_from_filename(string)
  @@all << self.new_from_filename(string)
end

def self.destroy_all
  @@all.clear

end
end
