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
    self.all << self.new
    self.all.detect {|song| song}
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
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    array_sorted = []
    object_sorted = []
    array_sorted = self.all.collect {|song| song.name}.sort.flatten

    array_sorted.each {|song|
        self.all.detect {|object|
        if object.name == song
          object_sorted << object
        end
      }
    }
    object_sorted
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" -")[0]
    song.name = filename.split("- ")[1].split(".")[0]
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
