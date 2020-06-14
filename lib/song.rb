class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
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
    song = self.new
    song.name = name
    @@all.detect { |i| i.name == song.name }
  end

  def self.find_or_create_by_name(name)

    if self.create_by_name(name) == self.find_by_name(name)
      self.find_by_name(name) 
    else 
      self.create_by_name(name)     
    end 
  end

  def self.alphabetical 
    @@all.sort_by { |songs| songs.name }
  end 

  def self.new_from_filename(filename)
     song = self.new
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")
     song.name = song_name
     song.artist_name = artist_name
     song 
  end 

  def self.create_from_filename(filename)
     song = self.create 
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")
     song.name = song_name
     song.artist_name = artist_name
  end

  def self.destroy_all
    @@all.clear 
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end

