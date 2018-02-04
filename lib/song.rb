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
    song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_file_array = data[1].split(".")
    song_file_array.pop
    name = song_file_array[0]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all<<self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end
end
