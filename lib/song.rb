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

  def self.create #self referes to the class. this is a class method
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    song = Song.new
    file_name_array = file_name.split(/[-.]/)
    song.artist_name = file_name_array[0].strip
    song.name = file_name_array[1].strip
    song
  end
end
