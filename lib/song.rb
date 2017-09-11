class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create #class constructor Song.create
  song = self.new #initializes a new song
  song.save #saves to class variable @@all
  song #returns song instance initialized and saved
end

def self.new_by_name(song_name) #Build a class constructor Song.new_by_name that takes in the string name of a song
  song = self.new  #returns a song instance with that name set as its name property
  song.name = song_name
  song
end

def self.create_by_name(song_name) #build a class constructor. looking for name of song
  song = self.create #initializes and saves. .create combines .new and .save
  song.name = song_name #giving song a name property
  song #returning song
end

def self.find_by_name(song_name) #creating class finder that passes string of song name
  @@all.detect {|song| song.name == song_name} #.find_by_name can find a song present in @@all by name
end

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file_name)
     data = file_name.split(" - ")
     artist_name = data[0]
     song_name = data[1].chomp(".mp3")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
   end

   def self.create_from_filename(file_name)
     data = file_name.split(" - ")
     artist_name = data[0]
     song_name = data[1].chomp(".mp3")
     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
   end

   def self.destroy_all
     self.all.clear
   end
  end
