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

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.create
    new_song = self.new #Step One Create Song
    new_song.save #Step Two Is to save the song but not return the return value of the save method because it's an array
    new_song # Now that new_Song has been saved above, we can return the song instance
  end

  def self.new_by_name(name)
    str = self.new(name)
    str
  end

  def self.create_by_name(name)
    the_song = self.new(name)
    the_song.save
    the_song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.new(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by do |item|
        item.name
    end
      sorted
  end

  def self.new_from_filename(string)
   new_arr = string.split(/[\-.]/)
   new_arr.take(2)
   song = self.new
   song.name = new_arr[1].lstrip
   song.artist_name = new_arr[0].rstrip
   song.save
   song
 end

  def self.create_from_filename(name)
    new_arr = name.split(/[\-.]/)
    new_arr.take(2)
    song = self.new
    song.name = new_arr[1].lstrip
    song.artist_name = new_arr[0].rstrip
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
