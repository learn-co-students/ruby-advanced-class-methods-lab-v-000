require 'pry'

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|word| word.name}
  end

  def self.new_from_filename(name)
    file_name = name.split(" - ")
    song = self.new
    song.artist_name = file_name[0]
    chopper = file_name[1].split(".")
    song.name = chopper[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.tap {|song| self.all << song}
  end

  def self.destroy_all
    @@all.clear
  end

end
