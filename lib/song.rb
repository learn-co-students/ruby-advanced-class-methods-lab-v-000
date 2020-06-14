class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create ##constructor
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|track| track.name == song_name}
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|a| a.name}
  end
  
  def self.new_from_filename(file)
    info = file.split(" - ")
    artist_name = info[0]
    song_name = info[1].gsub(".mp3", "")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
    
  end
  
  def self.create_from_filename(file)
    info = file.split(" - ")
    artist_name = info[0]
    song_name = info[1].gsub(".mp3", "")
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
  self.all.clear
end
  

end

##