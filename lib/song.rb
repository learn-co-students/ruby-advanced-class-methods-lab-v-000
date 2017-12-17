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
    song = Song.new
    song.save
     song
  end

  def self.new_by_name(name)
     song = self.new
     song.name=(name)
       song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name=(name)
      song
  end

  def self.find_by_name(name)
    self.all.detect {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    create_by_name
    find_by_name

  end

  def self.alphabetical
    self.sort {|a,b| a <=> b}
  end
end
