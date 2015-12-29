class Song
  attr_accessor :name, :artist_name
  @@songs = []

  def self.all
    @@songs
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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    fn = filename.split(" - ")
    artist = fn[0]
    name = fn[1].split('.')[0]

    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    fn = filename.split(" - ")
    artist = fn[0]
    name = fn[1].split('.')[0]

    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
