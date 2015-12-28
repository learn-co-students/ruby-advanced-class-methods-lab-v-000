require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|word| word.name}
  end

  def self.new_from_filename(name)
    array_name = name.split(" - ")
    song = self.new
    song_array_name = array_name[1].split(".")
    song.name = song_array_name [0]
    song.artist_name = array_name[0]
    song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end

binding.pry
