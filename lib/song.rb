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
   song.save
   song
  end

def self.new_by_name(name)
  new_song = self.new
  new_song.name = name
  new_song
end

def self.create_by_name(name)
  song = self.create
  song.name = name
  song
end

def self.find_by_name(name)
  @@all.find { |song| song.name == name }
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end

def self.alphabetical
  self.all.sort_by { |song| song.name }
end
def self.new_from_filename(file)
    song = Song.new
    song_array = file.split(" - ")
    song_name = song_array[1].chomp(".mp3")
    song.name = song_name
    song.artist_name = song_array[0]
    song
end
def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

def self.destroy_all
  @@all.clear
end

end
