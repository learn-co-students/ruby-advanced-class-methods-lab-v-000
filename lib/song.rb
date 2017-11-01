# require 'pry'

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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if name == self.find_by_name(name)
    else self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|name| name}
  end

end
    # accept a string name for a song and
    # either return a matching song instance with that name or
    #   create a new song with the name and return the song instance.




end
# binding.pry
