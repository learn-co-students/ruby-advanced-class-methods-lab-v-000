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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    filename_array = []
    filename_array = filename.split(" - ")
    name = filename_array[1]
    artist = filename_array[0]
    song = Song.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    filename_array = []
    filename_array = filename.split(" - ")
    name = filename_array[1]
    artist = filename_array[0]
    song = Song.create_by_name(name)
    song.artist_name = artist
    song
  end
end
