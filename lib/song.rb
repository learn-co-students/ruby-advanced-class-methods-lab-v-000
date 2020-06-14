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
    song = Song.new
    @@all << song
    return song
  end

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    return song
  end

  def Song.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if @@all.include?(name)
      @@all.detect{|song| song.name == name}
    else
      self.create_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def Song.new_from_filename(filename)
    array = filename.split(/\s[-]\s/)
    fixname = array[1].split(/[.]/)
    song = Song.new
    song.artist_name = array[0]
    song.name = fixname[0]
    return song
  end

  def Song.create_from_filename(filename)
    array = filename.split(/\s[-]\s/)
    fixname = array[1].split(/[.]/)
    song = Song.new
    song.artist_name = array[0]
    song.name = fixname[0]
    @@all << song
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end
