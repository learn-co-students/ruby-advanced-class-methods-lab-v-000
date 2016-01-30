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
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort do |a,b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = self.new
    song.name = data[1].split(".")[0] #remove the .mp3 extension
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    song = self.create
    song.name = data[1].split(".")[0] #remove the .mp3 extension
    song.artist_name = data[0]
    song
  end

  def self.destroy_all
    @@all = []
  end
  
end
