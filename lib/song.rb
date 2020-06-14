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
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    self.all.detect {|options| options.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort! do |a, b|
      a.name <=> b.name
    end
    return @@all
  end

  def self.new_from_filename(input)
    info = input.split(' - ')
    song = self.new
    song.artist_name = info[0]
    nameandmp3 = info[1]
    song.name = nameandmp3.chomp('.mp3')
    return song
  end

  def self.create_from_filename(input)
    info = input.split(' - ')
    song = self.new
    song.artist_name = info[0]
    nameandmp3 = info[1]
    song.name = nameandmp3.chomp('.mp3')
    @@all << song
    return song
  end

  def self.destroy_all
    @@all = []
  end
end
