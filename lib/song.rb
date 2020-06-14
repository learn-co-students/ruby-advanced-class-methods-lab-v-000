require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
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
    self.all << song
    song
  end

def self.find_by_name(name)
  @@all.find do |song|
    if song.name == name
      song
    end
  end
end

def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file)
  data = file.split(" - ")
  artist_name = data[0]
  name = data[1].slice(0..-5)

  song = self.new
  song.name = name
  song.artist_name = artist_name
  song

end


def self.create_from_filename(file)
  data = file.split(" - ")
  artist_name = data[0]
  name = data[1].slice(0..-5)

  song = self.new
  song.name = name
  song.artist_name = artist_name
  song.save
end

def self.destroy_all
  self.all.clear
end

  def save
    self.class.all << self
  end
end
