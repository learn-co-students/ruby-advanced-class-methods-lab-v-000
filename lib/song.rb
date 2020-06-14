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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |a| a.name }
  end

  def self.new_from_filename(string)
    song = self.find_or_create_by_name(string)
    data = string.split(/[-,.]/)
    artist_name = data[0].strip
    name = data[1].strip
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(string)
    song = self.new_from_filename(string)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end
