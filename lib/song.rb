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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name) 
    @@all.detect {|song| song.name == song_name}
    
  end
  
  def self.find_or_create_by_name(song_name)
    if @@all.include?(self.find_by_name(song_name))
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
    
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(mp3)
    name_and_artist = mp3.chomp(".mp3")
    data = name_and_artist.split(" - ")
    artist_name = data[0]
    name = data[1]
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(mp3)
    @@all << self.new_from_filename(mp3)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
