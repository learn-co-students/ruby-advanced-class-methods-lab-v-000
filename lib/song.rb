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

  def Song.create
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
    song = Song.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    found = "Song not found"
    @@all.each do |song|
      if song.name == name
        found = song
      end
    end
   found
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name)
    if found = "Song not found"
      Song.create_by_name(name)
    end
  end


  def self.alphabetical
    @@all.sort_by{|object| object.name}
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(".").delete_at(0).split(" - ")
    song = self.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end

#binding.pry
end
