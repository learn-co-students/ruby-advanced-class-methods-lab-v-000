class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  #   @@all << self
  # end

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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    song = @@all.detect {|s| s.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    fn = filename.split(".mp3").join
    song = self.new

    song.artist_name = fn.split(" - ")[0]
    song.name = fn.split(" - ")[1]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end
end
