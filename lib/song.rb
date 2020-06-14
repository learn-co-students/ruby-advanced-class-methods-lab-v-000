class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  # INSTANCE METHODS
  def save
    self.class.all << self
  end
  
  # CLASS METHODS 
  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file)
    song = self.new
    data = file.split(/(\s-\s|\Wmp3)/)
    song.name = data[2]
    song.artist_name = data[0]
    song
  end
  
  def self.create_from_filename(file)
    song = self.new
    data = file.split(/(\s-\s|\Wmp3)/)
    song.name = data[2]
    song.artist_name = data[0]
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
