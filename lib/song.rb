require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def initialize(name)#an instance method
    @name = name
  end
  def save #an instance method for self is not the receiver
    self.class.all << self #shovel instance of self to class array@@all
    self #returns instance of self
  end
  def detect (name)
    self.class.detect do|name_instance|
    self.name_instance == name
    end
  end
  def self.create# a class method, instantiate&save, for the receiver is self
    song = self.new(name)# dot NEW calls on the initialize method,
    #receives value from #argument name. assigns return value to variable save
    song.save #variable song to receive message from instance method save
  end
  def self.new_by_name(name)#new is instantiate but does not include saving
    song = self.new(name)
  end # does not work in repl.it, why???
  def self.create_by_name(name)
    song = self.new(name)
    song.save
  end
  def self.find_by_name(name)
    song = self.new(name)
    self.all.detect {|name_instance| name_instance.name == name}
    #binding.pry
  end
  #<Song @name="The Middle">
end
#https://repl.it/FbQ0/17
