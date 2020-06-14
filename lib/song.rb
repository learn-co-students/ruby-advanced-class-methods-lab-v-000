require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@name = ""

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song_name = self.new
    @@all << song_name
    return song_name
  end

  def self.new_by_name(name)
    @name = name
    new_name = self.new
    new_name.name = name
    return new_name
  end

  def self.create_by_name(name)
    @name = name
    create_name = self.new
    create_name.name = name
    @@all << create_name
    return create_name
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|name| name.name}
  end

  def self.new_from_filename(file)
    artist_and_name = file.split(" -")
    artist = artist_and_name[0]
    name_array = artist_and_name[1].split(".")
    name = name_array[0].lstrip!

    filename = Song.new
    filename.name = name
    filename.artist_name = artist
    filename
  end

  def self.create_from_filename(file)
    artist_and_name = file.split(" -")
    artist = artist_and_name[0]
    name_array = artist_and_name[1].split(".")
    name = name_array[0].lstrip!

    filename = Song.new
    filename.name = name
    filename.artist_name = artist
    @@all << filename
    filename
  end

  def self.destroy_all
    self.all.clear
  end

end
