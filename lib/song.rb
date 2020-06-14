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
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name  } 
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    song = self.new
    data = name.split("-")
    
    song.artist_name = data[0].strip

    song.name = data[1].split(".")[0].strip
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end









