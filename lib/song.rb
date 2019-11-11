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
      song = Song.new #initialize a new song
      song.save #saves the song
      song #returns the song
    end

def self.new_by_name(song_name) #takes in the string name of a song
    song = self.new #returns a song instance
    song.name = song_name #with that name set as its name property
    song #returns instance of song
  end

  def self.create_by_name(song_name)
   song = self.create
   song.name = song_name
   song
 end

 def self.find_by_name(song_name)
     self.all.detect{|s| s.name == song_name}
   end

   def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) || self.create_by_name(song_name)
   end

   def self.alphabetical
     self.all.sort_by{|s| s.name}
   end

   def self.new_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
   end

   def self.create_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
   end

   def self.destroy_all
     self.all.clear
   end


end #end class Song
