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
   song = self.new
   song.name = name 
   song
  end 

  def self.create_by_name(name)
    song = self.new
   song.name = name 
   song.save
   song
  end
  
  def self.find_by_name(name)
    @@all.detect {|s| return s if s.name == name}
    
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
end

  def self.alphabetical
      @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    str = filename.split(" - ")
    artist_name = str[0]
    song_name = str[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    str = filename.split(" - ")
    artist_name = str[0]
    song_name = str[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  
  

  
end
