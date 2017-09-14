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

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = new_by_name(string)
    @@all << song
    song
  end

  def self.find_by_name(string)
    @@all.detect do |song|
      song.name == string
    end
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) ? self.find_by_name(string) :
    self.create_by_name(string)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(/\s[-]\s|.mp3/)[0]
    song.name = filename.split(/\s[-]\s|.mp3/)[1]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
