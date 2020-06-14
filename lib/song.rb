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
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(song_details)
    details = song_details.slice!(".mp3")
    details = song_details.split(" - ")
    name = details[1]
    artist_name = details[0]
    
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(song_details)
    song = self.new_from_filename(song_details)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
