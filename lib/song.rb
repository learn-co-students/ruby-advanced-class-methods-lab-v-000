require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def initialize(name)
    @name = name
    self.class.all << self
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    self.all.push(name)
    binding.pry
    self.all
    binding.pry
  end
end
