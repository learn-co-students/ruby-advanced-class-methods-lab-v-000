require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

def initialize(name=nil,artist_name=nil)
  @name=name
  @artist_name=artist_name
  save
end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new
    @@all.last
  end

  def self.new_by_name(name)
   Song.new(name)
    @@all.pop
  end
 def self.create_by_name(name)
   Song.new(name)
    @@all.last
  end

def self.find_by_name(name)
  @@all.detect {|song| song.name==name}
end

def self.find_or_create_by_name(name)
  if Song.find_by_name(name)!=nil
    Song.find_by_name(name)
  else
    Song.create_by_name(name)
  end
end

def self.alphabetical
  Song.all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
 filename_holder= filename.split(" - ")
 test=filename_holder[1].split(".")
 filename_holder[1]=test[0]
 Song.new(filename_holder[1],filename_holder[0])
 Song.all.pop
end

def self.create_from_filename(filename)
  filename_holder= filename.split(" - ")
 test=filename_holder[1].split(".")
 filename_holder[1]=test[0]
 Song.new(filename_holder[1],filename_holder[0])

end

def self.destroy_all
    Song.all.clear
end
end
