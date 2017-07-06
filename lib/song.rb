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
    s = Song.new
    s.save
#binding.pry
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.create
    s.name = name
    s
  end

  def self.find_by_name(name)
    result = nil

     #binding.pry
    result = self.all.detect {|i| i.name == name}
    result
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    song_array = []
      song_array = filename.split(" - ")
      song_name_array = song_array[1].split(".mp3")
      s = self.new
      s.artist_name = song_array[0]
      s.name = song_name_array[0]
      s
    # binding.pry
  end
  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)

  end

  def self.destroy_all
    self.all.clear
  end

end
