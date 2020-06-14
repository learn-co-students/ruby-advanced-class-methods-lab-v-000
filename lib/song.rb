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
  
  def self.new_by_name(title)
    song = self.new 
    song.name = title
    song 
  end 
  
  def self.create_by_name(title)
    song = self.new 
    song.name = title
    @@all << song
    song
  end 
  
  def self.find_by_name(title)
    @@all.detect {|n| n.name == title}
  end 
  
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical 
    @@all.sort_by {|t| t.name}
  end 
  
  def self.new_from_filename(file)
    song = self.new 
    data = file.split(" - ")
    title = data[0]
    artist = data[1]
    artist_data = artist.split(".")
    singer = artist_data[0]
    song.artist_name = title
    song.name = singer
    song 
  end 
  
    def self.create_from_filename(file)
    song = self.new 
    data = file.split(" - ")
    title = data[0]
    artist = data[1]
    artist_data = artist.split(".")
    singer = artist_data[0]
    song.artist_name = title
    song.name = singer
    @@all << song
    song 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 



end
