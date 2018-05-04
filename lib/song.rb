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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end
  #binding.pry

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    song = self.new
    array = filename.gsub(/(\W\w\w\w$)/, "").split(" - ")
    #array = [artist_name, name]
    song.name = array[1]
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    array = filename.gsub(/(\W\w\w\w$)/, "").split(" - ")
    #array = [artist_name, name]
    song.name = array[1]
    song.artist_name = array[0]
    @@all << song
    song
  end
  #binding.pry
end
