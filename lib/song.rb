require 'pry'

class Song
  @@all = []
  attr_accessor :name, :artist_name

  def self.create
    song = self.new(name)
    song.save
    return song
  end

  def initialize(name)
    @name = name
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.detect {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(name)
    song_array = name.split(" - ")
    artist = song_array[0]
    song = song_array[1].split(".")[0]

    person = self.new(song) # This is an important line.
    person.name = song
    person.artist_name = artist
    person
  end

  def self.create_from_filename(name)
    song_array = name.split(" - ")
    artist = song_array[0]
    song = song_array[1].split(".")[0]

    person = self.new(song) # This is an important line.
    person.name = song
    person.artist_name = artist
    person.save
    person
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
