require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
     @@all
  end

  def self.save
    self.all << self
  end

  def self.create
    self.save
    self
  end
end
