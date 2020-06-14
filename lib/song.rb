class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name = nil, artist_name = nil)
    @name = name 
    @artist_name = artist_name
    @@all << self
  end
  
  def self.create(name = nil, artist_name = nil)
    song = self.new
    song.name = name 
    song.artist_name = artist_name
    @@all << song
    song
  end  

  def self.all
    @@all
  end
  
  def self.new_by_name(name) 
    song = self.new(name)
    song.save
    song
  end
  
  def self.create_by_name(name) 
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name) 
    @@all.find {|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted = self.all.uniq.sort_by {|song| song.name}
    sorted
  end
  
  def self.new_from_filename(file)
    f = file.split(".").first
    artist = f.split(" - ").first.strip 
    song_name = f.split(" - ").last.strip
    song = self.new_by_name(song_name)
    song.name = song_name
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file)
    f = file.split(".").first
    artist = f.split(" - ").first.strip
    song_name = f.split(" - ").last.strip
    song = self.new(song_name, artist)
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
puts song.name.length
puts song.artist_name.length
