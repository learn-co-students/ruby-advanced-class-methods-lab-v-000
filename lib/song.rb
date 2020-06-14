class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil, artist_name=nil)
    @name = name if name
    @artist_name = artist_name if artist_name
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil, artist_name=nil)
    self.new(name, artist_name).save[-1]
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    self.new(parts[1].split(".")[0], parts[0])
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
