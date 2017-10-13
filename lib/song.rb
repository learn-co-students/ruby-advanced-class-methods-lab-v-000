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
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect do |x|
      x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! do |x|
      x.name
    end
    @@all
  end

  def self.new_from_filename(name)
    song = self.new
    namesplit = name.split(" - ")
    song.artist_name = namesplit[0]
    song.name = namesplit[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(name)
    song = self.new
    namesplit = name.split(" - ")
    song.artist_name = namesplit[0]
    song.name = namesplit[1].chomp(".mp3")
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

#binding.pry
