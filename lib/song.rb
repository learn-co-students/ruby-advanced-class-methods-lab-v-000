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
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end
  
  def self.new_from_filename(filename)
   song = self.new
   array_temp = []
   array_temp = filename.split(' - ')
   song.name = array_temp[1].gsub(".mp3","")
   song.artist_name = array_temp[0]
   song
  end
  
  def self.create_from_filename(filename)
    song = self.new
   array_temp = []
   array_temp = filename.split(' - ')
   song.name = array_temp[1].gsub(".mp3","")
   song.artist_name = array_temp[0]
   song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
