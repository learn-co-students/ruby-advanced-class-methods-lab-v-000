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
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    name_array = []
    @@all.each do |songs|
      name_array << songs
    end
    name_array.sort_by {|song| song.name}
  end

  def self.new_from_filename(string)
      song = self.new
      split = string.split("- ")
      song.name = split[1].chomp(".mp3")
      song.artist_name = split[0].chop
      song
  end

  def self.create_from_filename(string)
    song = self.new
    split = string.split("- ")
    song.name = split[1].chomp(".mp3")
    song.artist_name = split[0].chop
    song
    @@all <<song
  end

  def self.destroy_all
    @@all.clear
  end
end
