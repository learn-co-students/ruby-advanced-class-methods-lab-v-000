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
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.new
    song.save
    song

  	# if @@all.key?(name)
   #    @@all.detect {|song| song.name == name}
   #  else
   #    song = Song.new
   #    song.save
   #    song.name = name
   #    song
   #  end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\s-\s|.mp3/)
    song = self.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.save
    filename_array = filename.split(/\s-\s|.mp3/)
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.destroy_all
  	@@all.clear
  end

end
