class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name="")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all << self.new(name)
    @@all[-1]
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.all << self.new(name)
    @@all[-1]
  end

  def self.find_by_name(name)
    self.all.detect do |find_song|
      find_song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    self.new(array[-1][0..-5], array[0])
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    self.all << self.new(array[-1][0..-5], array[0])
  end

  def self.destroy_all
    @@all.clear
  end

end
