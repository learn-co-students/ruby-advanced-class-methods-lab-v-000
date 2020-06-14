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
    @@all << self.new
    @@all[-1]
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
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    file = filename.split(" - ")
    song.artist_name = file[0]
    song.name = file[1].chomp(".mp3")
    song
  end
  def self.create_from_filename(filename)
    song = self.create
    file = filename.split(" - ")
    song.artist_name = file[0]
    song.name = file[1].chomp(".mp3")
    song
  end
  def self.destroy_all
    @@all.clear
  end
end
