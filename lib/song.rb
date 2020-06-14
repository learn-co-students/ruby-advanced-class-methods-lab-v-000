class Song
  attr_accessor :name, :artist_name
  @@all = []

  #---------------------------------------------------------------
  # constructors

  def initialize(name = nil, artist_name = nil)
    @name = name; @artist_name = artist_name
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.new_from_filename(fullname)
    song = self.new
    arr = fullname.split(" - ")
    arr[1].gsub!(".mp3","")
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  #---------------------------------------------------------------
  # Class methods

  def self.find_by_name(str)
    self.all.detect { |song| song.name == str}
  end

  def self.find_or_create_by_name(str)
    self.find_by_name(str) || self.create_by_name(str)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  #---------------------------------------------------------------
  # Instance methods

  def save
    self.class.all << self
  end

end
