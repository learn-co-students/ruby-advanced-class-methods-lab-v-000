
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
    self.new.save
    self.all.last
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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.parse(filename)
    info = []
    parsed = filename.split(" - ")
    info << parsed[0]
    info << parsed[1].chomp(".mp3")
    info
  end

  def self.new_from_filename(filename)
    song = self.new_by_name(self.parse(filename)[1])
    song.artist_name = self.parse(filename)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create_by_name(self.parse(filename)[1])
    song.artist_name = self.parse(filename)[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
