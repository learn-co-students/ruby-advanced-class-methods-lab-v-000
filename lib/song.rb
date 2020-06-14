require 'pry'
class Song
  attr_accessor :name, :artist_name, :formt
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
    @@all.find{|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    info = strip_filename(filename)
    song = self.new
    song.artist_name = info[0]
    song.name = info[1]
    song
  end

  def self.create_from_filename(filename)
    info = strip_filename(filename)
    song = self.create_by_name(info[1])
    song.artist_name = info[0]
    song.formt = info[2]
    song
  end

  def self.strip_filename(filename)
      info = filename.split("-")
      info[0] = info[0].rstrip
      info[1] = info[1].split(".")[0].lstrip
      info
  end

  def self.destroy_all
    @@all.clear
  end

end
