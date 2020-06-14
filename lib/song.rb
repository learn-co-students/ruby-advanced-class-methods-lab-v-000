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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    song.artist_name = file.split(" - ")[0]
    song.name = file.split(" - ")[1].gsub(/.mp3/, "")
    song
  end

  def self.create_from_filename(file)
    song = Song.new                             #normally would put self.new... just playing around and being less abstract
    song.artist_name = file.split(" - ")[0]     #also could skip first three steps by calling previous method
    song.name = file.split(" - ")[1].gsub(/.mp3/, "")
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
end
