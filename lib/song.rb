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
    # or song.save, but the code above is arguably better.
    # The song shouldn't save itself into @@all; the Song class should save the song into @@all.
    # However, it could also be argued that song.save is more elegant and abstract!
    
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song 
    song
  end 
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
  end 
  
  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename) # Refactor this!
    parsed_song = filename.chomp(".mp3").split(" - ")
    artist = parsed_song[0]
    name = parsed_song[1]
    song = self.new 
    song.add_artist_and_name(artist, name)
    song
  end
  
  def add_artist_and_name(artist, name)
    self.artist_name = artist
    self.name = name 
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save # or self.all << song
    song 
  end
  
  def self.destroy_all 
    self.all.clear
  end
end
