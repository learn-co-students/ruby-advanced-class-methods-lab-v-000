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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      song = self.find_by_name(name)
    else
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[-1].gsub(/\.mp3$/, "")
    artist = filename.split(" - ")[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    name = filename.split(" - ")[-1].gsub(/\.mp3$/, "")
    artist = filename.split(" - ")[0]
    song = self.find_or_create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end

end
