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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name=(name)
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(string)
    song = self.new
    song.artist_name = string[/.+\-/][0..-3]
    song.name = string[/-.+\./][1..-2].strip
    song
  end

  def self.create_from_filename(string)
    song = self.new
    song.artist_name = string[/.+\-/][0..-3]
    song.name = string[/-.+\./][1..-2].strip
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

