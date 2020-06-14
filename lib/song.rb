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
      song.name =name
      song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
     song
  end

  def self.find_by_name(name)
      Song.all.detect do |w|
        w.name == name
      end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    song = parts[1].gsub(".mp3", "")
    songA = self.new
    songA.name = song
    songA.artist_name = artist
    songA
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist = parts[0]
    song = parts[1].gsub(".mp3", "")
    songA = self.create
    songA.name = song
    songA.artist_name = artist
    self.all << songA
  end

  def self.destroy_all
    self.all.clear
  end
end
