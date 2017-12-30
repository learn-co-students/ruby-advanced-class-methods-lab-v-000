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
    @song = self.new
    @song.save.last
  end

  def self.new_by_name(n)
    @song = self.new
    @song.name = n
    @song 
  end

  def self.create_by_name(n)
    self.new_by_name(n)
    @song.save.last
  end
end
