require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name=nil)
    @name = name
  end

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
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    return song
  end

  def self.find_by_name(song)
    @@all.detect { | el | el.name == song }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |i| i.name }
  end

  def self.new_from_filename(name)
    # take apart filename
    name = name.split(" - ")
    song = self.new(name[1].split(".")[0])
    song.artist_name = name[0]
    # make new song instance
    return song
  end

  def self.create_from_filename(name)
    # take apart filename
    name = name.split(" - ")
    song = self.new(name[1].split(".")[0])
    song.artist_name = name[0]
    # make new song instance
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
