class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new 
    s.save
    s
  end
  
  def initialize
  end
  
  def self.new_by_name(name)
    s = self.new 
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = self.new 
    s.name = name
    s.save
    s
  end
  
  def self.find_by_name(name)
    self.all.detect{|n| n.name == name}  
  end
  
  
  #find out if the song already exists
  #is it does not exist create new song and return
  
  def self.find_or_create_by_name(name)
    # song_exist = self.all.detect{|s| s.name == name} 
    # if song_exist == nil
    # s = self.new 
    # s.name = name
    # s.save
    # s
    song_exist = self.find_by_name(name)
    if song_exist == nil
      self.create_by_name(name)
  else
    song_exist
   end
  end
 
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(file_format)
     s = self.new
     s.name = file_format.chomp(".mp3").split("- ")[1]
     s.artist_name = file_format.split(" -")[0]
     s
  end

  def self.create_from_filename(file_format)
     s = self.new
     s.name = file_format.chomp(".mp3").split("- ")[1]
     s.artist_name = file_format.split(" -")[0]
     s.save
     s
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
