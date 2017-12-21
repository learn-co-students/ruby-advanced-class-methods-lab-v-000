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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    return song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    return song
  end

  def self.find_by_name(title)
    @@all.detect { |song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1].gsub(".mp3", "")
    artist_name = data[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    name = data[1].gsub(".mp3", "")
    artist_name = data[0]

    song = self.create
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.destroy_all
    @@all.clear
  end
end
