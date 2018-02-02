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
    self.all << song
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
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    names = self.all.sort do |a, b|
      a.name <=> b.name
    end
    names
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    name = array[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    name = array[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
    self.all << song
  end

  def self.destroy_all
    @@all = []
  end

end
