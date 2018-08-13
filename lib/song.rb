class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    self.all.detect {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    array2 = array[1].split(".")
    name = array2[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    array2 = array[1].split(".")
    name = array2[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear

  end

  def save
    self.class.all << self
  end

end
