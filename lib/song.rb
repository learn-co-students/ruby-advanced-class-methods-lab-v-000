require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    #new_song.name = name
    @@all << song
    #binding.pry
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    #song.name = name
    #binding.pry
  end

  def self.create_by_name(name)
    song=self.new
    song.name=name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    answer = @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    answer = filename.split(" - ")
    song.artist_name = answer[0]
    song.name = (answer[1]).chomp(".mp3")
    song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new
    answer = filename.split(" - ")
    song.artist_name = answer[0]
    song.name = (answer[1]).chomp(".mp3")
    @@all<<song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
