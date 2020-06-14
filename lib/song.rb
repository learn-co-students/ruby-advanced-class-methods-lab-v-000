require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    array = name.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = new_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
