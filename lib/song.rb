require "pry"

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
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? song = self.create_by_name(name) : find_by_name(name)
  end

  def self.alphabetical
    alpha_names = []
    alpha_names = self.all.collect {|song| song.name}
    alpha_names.sort.collect {|name| find_by_name(name)}
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song = self.new_by_name(file[1].chomp!(".mp3"))
    song.artist_name = file [0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
