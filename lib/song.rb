class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.find_by_name(name)
    song = self.all.select {|song| song.name == name}.first
    return song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    songs = filename.split(/[\.\-]/)
    song.artist_name = songs[0].strip
    song.name = songs[1].strip
    return song
  end

  def self.create_from_filename(filename)
    song = self.new
    songs = filename.split(/[\.\-]/)
    song.artist_name = songs[0].strip
    song.name = songs[1].strip
    return song
  end

  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end

end
