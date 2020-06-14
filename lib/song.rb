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
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.find { |s| s.name == name }
  end
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result == nil ? self.create_by_name(name) : result
  end
  
  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end
  
  def self.new_from_filename(file)
    song = self.create
    song.artist_name = file.split(" - ")[0]
    song.name = file.split(" - ").last.chomp(".mp3")
    song
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    self.all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
