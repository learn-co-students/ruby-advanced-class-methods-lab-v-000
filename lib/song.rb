require "pry"

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
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !(find_by_name(name))
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(string)

    array = string.split(" - ")
    title = array[1].split(".")

    song = self.new_by_name(title[0])
    song.artist_name = array[0]

    song

  end

  def self.create_from_filename(string)

    array = string.split(" - ")
    title = array[1].split(".")

    song = self.create_by_name(title[0])
    song.artist_name = array[0]

    song

  end

  def self.destroy_all
    @@all = []
  end
end
