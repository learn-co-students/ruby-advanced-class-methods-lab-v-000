class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = name
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
  Song.all.detect{|s| s.name == name}
end

def self.find_or_create_by_name(name)
  if Song.find_by_name(name) == name
    song
  else 
    Song.create_by_name(name)
  end
end
  
  def self.alphabetical 
    Song.all.sort_by {|word| word.name}
end 

def self.new_from_filename(song_name)
    song = self.new
    song.name = ((song_name.split('-')[1]).split('.')[0].strip)
    song.artist_name = song_name.split('-')[0].strip
    song
 

#  Song.new_by_name((song_name.split('-')[1]).split('.')[0].strip) 
 # song.artist_name = song_name.split('-')[0].strip
end 

def self.create_from_filename(song_name)
    song = self.new
    song.name = ((song_name.split('-')[1]).split('.')[0].strip)
    song.artist_name = song_name.split('-')[0].strip
    @@all << song
    song 
end

#returns a song instance with that
#name set as its name property and the song being saved into the @@all class variable.
 


  def save
    self.class.all << self
  end

  def self.destroy_all 
    @@all.clear
  end

end
