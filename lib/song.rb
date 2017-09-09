require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = self.new
    parsed = file.split(" - ")
    song.artist_name = parsed[0]
    song.name = parsed[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(file)
    song = self.new
    parsed = file.split(" - ")
    song.artist_name = parsed[0]
    song.name = parsed[1].chomp(".mp3")
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
