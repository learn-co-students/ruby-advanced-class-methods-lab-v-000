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
    item = self.new
    item.save
    item
  end

  def self.new_by_name(name)
    item = self.new
    item.name = name
    item
  end

  def self.create_by_name(name)
    item = self.new
    item.name = name
    item.save
    item
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.detect{|person| person.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)==nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name<=>b.name}
  end

  def self.new_from_filename(string)
    artist_string = string.split(/\s*[.-]\s*/)
    song = self.new_by_name(artist_string[1])
    song.artist_name = artist_string[0]
    song
  end

  def self.create_from_filename(string)
    artist_string = string.split(/\s*[.-]\s*/)
    song = self.create_by_name(artist_string[1])
    song.artist_name = artist_string[0]
    song
  end

end
