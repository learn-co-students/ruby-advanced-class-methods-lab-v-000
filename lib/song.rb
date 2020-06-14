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
  
  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    song
  end
  
  def self.create_by_name(string_name)
    song = self.new
    song.name = string_name
    song.save
    song
  end 

  def self.find_by_name(string_name)
    self.all.detect { |song| song.name == string_name }
  end
  
  def self.find_or_create_by_name(string_name)
   self.find_by_name(string_name) || self.create_by_name(string_name)
  end 

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end 
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    @@all.clear
  end
end
