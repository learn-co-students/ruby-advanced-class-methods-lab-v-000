class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create()
    s = Song.new
    s.save
    s
  end
  
  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = self.new_by_name(name)
    s.save
    s
  end
  
  def self.find_by_name(name)
    songs = self.all
    idx = songs.index{|s| s.name == name}
    
    if idx == nil
      return nil
    end
    
    songs[idx]
  end
  
  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    
    if s == nil
      s = self.create_by_name(name)
    end
    s
  end
  
  def self.alphabetical
    songs = self.all
    s = songs.sort_by{|x| x.name}
    s
  end
  
  def self.new_from_filename(file_name)
    arr = file_name.split(" - ")
    name = arr[1].scan(/.*[^[[.][m][p][3]]]/)[0]
    artist = arr[0]
    
    s = self.new_by_name(name)
    s.artist_name = artist
    s
  end
  
  def self.create_from_filename(file_name)
    s = self.new_from_filename(file_name)
    
    s.save
    s
  end    
  
  def self.destroy_all
    arr = self.all
    arr.clear
  end
end
