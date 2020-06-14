class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    return song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort! { |a, b|  a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    artist, name=filename.split(" - ")
    song.artist_name=artist
    song.name=name.sub(/\.(.*)/,"")
    return song
  end

  def self.create_from_filename(filename)
    song = self.new
    artist, name=filename.split(" - ")
    song.artist_name=artist
    song.name=name.sub(/\.(.*)/,"")
    @@all<<song
    return song
  end

  def self.destroy_all
    @@all.clear
  end
end
