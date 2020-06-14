class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
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
    self.all.detect { |obj| obj.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort { |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist = file[0]
    song = file[1].gsub(/.mp3/,"")

    new_song = self.create_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
