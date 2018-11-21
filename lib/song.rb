class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name = nil)
    @name = name
  end

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
    song = Song.new(name)
    song
  end
  
  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    song_name = file_array[1].chomp(".mp3") 
    artist = file_array[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist 
    song.save
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end 
  
  def self.destroy_all
    @@all.clear
  end

end
