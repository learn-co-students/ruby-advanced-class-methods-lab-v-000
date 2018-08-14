require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(/\s*[.-]\s*/)
    filename_arr.delete('mp3')
    name = filename_arr[1]
    artist_name = filename_arr[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
