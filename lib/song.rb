require 'pry'

class Song
  attr_accessor :name, :artist_name # Default
  @@all = []  # Default

  def self.all # Default
    @@all
  end

  def save # Default
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
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
    Song.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
     if Song.find_by_name(name)
      name
     else
      Song.new_by_name(name)
     end
  end

  def self.alphabetical
    Song.all.collect.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(file)
    file = file.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(file)
    file = file.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end


