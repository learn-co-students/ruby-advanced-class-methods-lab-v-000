class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1].gsub(".mp3", "")
    
    song = self.new
    song.name=name
    song.artist_name=artist
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
