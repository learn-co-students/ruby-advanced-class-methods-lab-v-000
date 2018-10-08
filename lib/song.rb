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
    song =self.new
    song.save 
    song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end 
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end 
  
  def self.new_from_filename(mp3)
    song = self.new
    data = mp3.split(" - ")
      name = data[1].gsub(".mp3","")
      artist = data[0]
    song.name = name 
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(song)
    self.find_by_name(song)
    @@all << self.new_from_filename(song)
    self.new_from_filename(song)
  end
  
  def self.destroy_all 
    @@all = []
  end 
end

  # def self.new_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name = parts[0]
  #   song_name = parts[1].gsub(".mp3", "")

  #   song = self.new
  #   song.name = song_name
  #   song.artist_name = artist_name
  #   song
  # end
  
  # def self.destroy_all
  #   self.all.clear
  # end
