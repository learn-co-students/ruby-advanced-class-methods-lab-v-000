require 'pry'
class Song
  attr_accessor :artist_name, :name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new = self.new
    self.all << new
    new
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new = self.new_by_name(name)
    self.all << new
    new
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
    self.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    track = file[1]
    artist = file[0]
    song = self.new_by_name(track)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    track = file[1]
    artist = file[0]
    song = self.new_by_name(track)
    song.artist_name = artist
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end


end
