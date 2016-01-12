require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
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
    self.all.find do |song| 
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
      if song == name
        song
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    song = self.new
    
    song.artist_name = filename.split(" - ")[0] 
    song.name = filename.split(" - ")[1].sub(/.mp3/, '')
    song 
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song

  end

  def self.destroy_all
    self.all.clear
  end
end
