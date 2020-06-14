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
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    Song.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    Song.all.collect.sort_by{|song| song.name}  
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist_name = filename_array[0]
    name = filename_array[1].gsub(".mp3", "")
    
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.destroy_all
    @@all = []
  end
end
