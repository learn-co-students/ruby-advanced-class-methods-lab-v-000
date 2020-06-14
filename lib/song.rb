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
    return song 
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    return song 
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save 
    return song 
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new 
    split_song = filename.split(" - ")
    song.artist_name = split_song[0]
    split_title = split_song[1].split(".")
    song.name = split_title[0]
    return song
  end
  
  def self.create_from_filename(filename)
    song = self.new 
    split_song = filename.split(" - ")
    song.artist_name = split_song[0]
    split_title = split_song[1].split(".")
    song.name = split_title[0]
    song.save
    return song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
