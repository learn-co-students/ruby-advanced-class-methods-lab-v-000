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
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name_to_find)
    self.all.detect {|song| song.name == name_to_find}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(file)
    song = file.split(" - ")
    artist = song[0]
    title = song[1].split(".")[0]

    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = file.split(" - ")
    artist = song[0]
    title = song[1].split(".")[0]

    song = self.create
    song.name = title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
