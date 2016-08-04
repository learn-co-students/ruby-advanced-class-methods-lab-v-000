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
    self.all.push(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name =name
    song
  end

  def self.create_by_name(name)
    #binding.pry
    self.all.push(self.new_by_name(name))
    @@all.last
  end

  def self.find_by_name(name)
    self.all.detect {|d| name == d.name}
  end

  def self.find_or_create_by_name(name)
  end



end
