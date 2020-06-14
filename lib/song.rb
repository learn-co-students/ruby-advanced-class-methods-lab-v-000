require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name=(new_name)
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name=(name)
    song.save
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end

    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
    song = self.new
    trimmed = string.sub(/\.mp3/, "")
    trimmed_array = trimmed.split("-")
    song.name = trimmed_array[1].strip
    song.artist_name = trimmed_array[0].strip
    song
  end

  def self.create_from_filename(string)
    song = self.new
    @@all << song
    trimmed = string.sub(/\.mp3/, "")
    trimmed_array = trimmed.split("-")
    song.name = trimmed_array[1].strip
    song.artist_name = trimmed_array[0].strip
  end

  def self.destroy_all
    self.all.clear
  end



end
