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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name} 
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_array = filename.split(" - ")
    song_array = artist_array[1].split(".")
    song = self.create
    song.name = song_array[0]
    song.artist_name = artist_array[0]
    song
  end

  def self.create_from_filename(filename)
    artist_array = filename.split(" - ")
    song_array = artist_array[1].split(".")
    song = self.create
    song.name = song_array[0]
    song.artist_name = artist_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
