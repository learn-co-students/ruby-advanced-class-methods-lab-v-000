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
    s = Song.new
    s.save
#binding.pry
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.create
    s.name = name
    s
  end

  def self.find_by_name(name)
    # result = nil
    # result =
     binding.pry
    self.all.detect {|i| i.name = name}
  end



end
