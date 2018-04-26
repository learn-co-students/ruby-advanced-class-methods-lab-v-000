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
    song.save
    song
 end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    song = self.create
    song.artist_name = parts[0]
    song.name = parts[1].gsub(".mp3", "")
    song
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    song = self.create
    song.artist_name = parts[0]
    song.name = parts[1].gsub(".mp3", "")
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
