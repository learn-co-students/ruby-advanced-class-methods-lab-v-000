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
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

def self.create_by_name(song_name)
  song = self.create
  song.name = song_name
  song
end

def self.find_by_name(song_name)
    self.all.find{|song|song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name) == nil
     self.create_by_name(song_name)
  else
    self.find_by_name(song_name)
  end
end

def self.alphabetical
    self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1].chomp(".mp3")
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
end

def self.create_from_filename(file_name)
   file = file_name.split(" - ")
    artist_name = file[0]
    song_name = file[1].chomp(".mp3")
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  
end

def self.destroy_all
    @@all.clear
end
  
end
