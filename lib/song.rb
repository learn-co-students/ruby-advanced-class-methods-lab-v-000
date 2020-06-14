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
    @@all << song
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end
  def self.find_by_name(name)
    @@all.detect{|song|song.name==name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by{ |i| i.name }
  end
  def self.new_from_filename(filename)
    song = self.new
    new_from_filename = filename.chomp(".mp3").split(" - ")
    song.name = new_from_filename[1]
    song.artist_name = new_from_filename[0]
    song
  end
  def self.create_from_filename(filename)
    song = self.new
     @@all << song
     new_from_filename = filename.chomp(".mp3").split(" - ")
    song.name = new_from_filename[1]
    song.artist_name = new_from_filename[0]
    song
  end
  def self.destroy_all
    self.all.clear
  end
    
end
