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
    song = self.find_by_name(name)
    if song != nil
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filearray = "#{filename}".split(/[.-]/)
    song = self.new
    song.artist_name = filearray.shift.strip
    song.name = filearray.shift.strip
    song
  end

  def self.create_from_filename(filename)
    filearray = "#{filename}".split(/[.-]/)
    song = self.new
    song.artist_name = filearray.shift.strip
    song.name = filearray.shift.strip
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
