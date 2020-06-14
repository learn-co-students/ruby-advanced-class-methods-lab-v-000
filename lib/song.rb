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
    self.all << song
    song
  end 
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new 
    self.all << song
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|a| a.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else 
      find_by_name(song_name)
    end
  end 
  
  def self.alphabetical 
    self.all.sort_by{|a| a.name}
  end 
  
  def self.new_from_filename(file_name)
    name = file_name.split("-")[1].strip.chomp(".mp3")
    artist_name = file_name.split("-")[0].strip
    
    song = self.new
    song.name = name 
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file_name)
    name = file_name.split("-")[1].strip.chomp(".mp3")
    artist_name = file_name.split("-")[0].strip
    
    song = self.new
    self.all << song
    song.name = name 
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
