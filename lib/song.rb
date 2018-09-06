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
    s = self.new
    s.save
    s
  end
  
  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end
  
  def self.create_by_name(song_name)
    s = self.new
    s.name = song_name
    s.save
    s
  end
  
  def self.find_by_name(song_name)
    self.all.detect {|s| s.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end
  
  def self.new_from_filename(filename)
    single = self.new
    single.name = filename.split(" - ")[1].chomp(".mp3")
    single.artist_name = filename.split(" - ")[0]
    single
  end
  
  def self.create_from_filename(filename)
    single = self.new
    single.name = filename.split(" - ")[1].chomp(".mp3")
    single.artist_name = filename.split(" - ")[0]
    single.save
    single
  end
  
  def self.destroy_all
    self.all.clear
  end
    
end
