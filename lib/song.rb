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
      song = self.new
      self.all << song
      song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name  ## don't just use the variable. call the method to expose the variable
    self.all << song
    song
  end

  def self.find_by_name(string_name)
    self.all.detect {|song| song.name == string_name}
  end

  def self.find_or_create_by_name(title)
    if find_by_name(title)
      found_song = find_by_name(title)
    else
      create_by_name(title)
    end
  end

  def self.alphabetical
    binding.pry
    self.all.sort
  end


end
