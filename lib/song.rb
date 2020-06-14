class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = new
    song.save
    song
  end

  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |s| s.name }
  end

  def self.new_from_filename(filename)
    artist =filename.split(' - ').first
    name = filename.split(' - ').last.split('.').first
    new(name, artist)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(name=nil, artist=nil)
    @name = name
    @artist_name = artist
  end

  def save
    self.class.all << self
  end

end
