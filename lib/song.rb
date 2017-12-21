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
     song = self.new
     song.name=(name)
       song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name=(name)
      song
  end

  def self.find_by_name(name)
    self.all.detect {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical

    @@all.sort_by {|song| song.name}


  end

  def self.new_from_filename(name, artist_name)
    song = self.new_from_filename(name, artist_name)
    song.name
    song.artist_name

  end
end
