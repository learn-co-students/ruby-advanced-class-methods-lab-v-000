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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name=name
    s
  end

  def self.create_by_name(name)
      s = self.new_by_name(name)
      s.save
      s
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort {|song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(filename)
    name=filename.split(/(.mp3|-)/)[2].lstrip
    artist=filename.split(/(.mp3|-)/)[0].chop
    s = self.new_by_name(name)
    s.artist_name=artist
    s
    #binding.pry
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save
  end

  def self.destroy_all
    self.all.clear
  end

end
