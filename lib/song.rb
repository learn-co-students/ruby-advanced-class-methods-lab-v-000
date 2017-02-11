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
    #receives value from #argument, name. assigns return value to variable save
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
  def self.find_or_create_by_name(name)
    #if we find it, return it
    if self.all.detect {|name_instance| name_instance.name == name}
      #binding.pry
      song = self.find_by_name(name)
    else #otherwise, create it
      song = self.create_by_name(name)
    end
    return song
  end
  #failed in repl.it
  def self.alphabetical#argument is not required here, for wrong number of arguments
    #in line 50 error occurred
    # binding.pry
    # MYVERSION:song = self.create_by_name(name)
    # song.sort_by!{|word|word}: note song is used instead(57thLine)btwn pipes
    # then song is called to receive the value from method name
    # song
    #EXPERT: 1st=return @@all to return all values in the class array
    return @@all.sort_by{|song| song.name}
    #note song is used instead(57thLine)btwn pipes
    #then song is called to receive the value from method name
    #method name is from :name attr_accessor
  end
  def self.new_from_filename(name)
    #binding.pry
    input_array = []
    input_array = name[0..-5].split(" - ")#LEARN: Range[..]
    artist_name = input_array[0]
    name = input_array[1]
    @variable = self.new(name) #LEARN: variable assignment to Self
    @variable.artist_name = artist_name#LEARN: attr_accessor provides
    #artist_name method to provide message to receiver, variable
    @variable #returns Song object instance
    #binding.pry
  end
  def self.create_from_filename(name)
    binding.pry
    input_string = ""
    @artist_name = artist_name
    @name = name
    input_string = "#{artist_name} - #{name}.mp3"
  end
end
#https://repl.it/FbQ0/17
