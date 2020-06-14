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
    result = @@all.detect {|song| song.name == name}
    result
  end
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file)
    file = file.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end
  
  def self.create_from_filename(file)
    file = file.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song.save
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
