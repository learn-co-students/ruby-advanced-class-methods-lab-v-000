class Song
  attr_accessor :name, :artist_name, :title

  #def name
  #  @name
  #end

  #def name=(name)
#    @name = name
#  end


  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  # create - saved instance
  song = Song.new
  song.save
  song
end

def self.new_by_name(name)
  # new - unsaved instance
  # instance as being a specific type of a class, for examples, Suzanne is an instance of People
  song = Song.new
  song.name = name
  song
end

def self.create_by_name(name)
song = Song.create
song.name = name
song
end

def self.find_by_name(name)
@@all.find do |song|
  song.name == name
end
end

def self.find_or_create_by_name(name)
if song = Song.find_by_name(name) # Song.find_by_name(name) returns an object if it finds one
   song# how do we return the object that was found?
  else
    Song.create_by_name(name)


end
end

def self.alphabetical
self.all.sort_by {|s| s.name}




end

def self.new_from_filename(filename)
  new_song = Song.new
  filename.split(" - ")
  artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1].gsub('.mp3', '')

  new_song.name = song_name
  new_song.artist_name = artist_name
  new_song
end
def self.create_from_filename(filename)
  song_match = Song.create
  filename.split(" - ")
  artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1].gsub('.mp3', '')

  song_match.name = song_name
  song_match.artist_name = artist_name
  song_match.save
  song_match

end
def self.destroy_all
  @@all.clear
end

end
