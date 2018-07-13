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
    song=Song.new
    song.save
    song 
end
def self.new_by_name(song_name)
  song=Song.new
  song.name=song_name
  song
  
end
def self.create_by_name(song_name)
  song=self.create
  song.name=song_name
song
end
def self.find_by_name(song_name)
  @@all.detect{|songs|songs.name==song_name}

 end 
 
 def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name)||self.create_by_name(song_name)
 end
 def self.alphabetical
   self.all.sort_by{|s|s.name}
 end
 
 def self.new_from_filename(filename)
   readout=filename.split(" - ")
   artist=readout[0]
   song_name=readout[1].gsub(".mp3","")
   
   song=self.new
   song.artist_name= artist
   song.name=song_name
   song 
   
 end
 def self.create_from_filename(filename)
   readout=filename.split(" - ")
   artist=readout[0]
   song_name=readout[1].gsub(".mp3","")
  
  song=self.create
  song.name=song_name
  song.artist_name=artist
  song
 end
 
 
 def self.destroy_all
   @@all.clear
 end
end