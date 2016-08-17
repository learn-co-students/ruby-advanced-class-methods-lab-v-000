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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name =name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name =name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|n| n.name}
  end

  def self.new_from_filename(filename)
    @song = self.new
    @song.name = filename.split("-")[1].split(".")[0].strip
    @song.artist_name = filename.split("-")[0].strip
    @song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    self.all << @song
  end

  def self.destroy_all
    @@all.clear
  end
end
