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
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    name_finder = @@all.select {|song| song.name == name}
    name_finder[0]
  end

  def self.find_or_create_by_name(name)
      name_finder = @@all.select {|song| song.name == name}
      if name_finder.empty?
        self.create_by_name(name)
      else
        name_finder[0]
      end
  end

  def self.alphabetical
    alphabetical = @@all.map {|song| song.name}
    alphabetical.sort!
    songs = []
    alphabetical.each do |name|
      songs << self.find_by_name(name)
    end
    songs
  end

  def self.new_from_filename(filename)
    song = self.new
    file_arr = filename.split(" - ")
    name_split = file_arr[1].split(".")
    song.name = name_split[0]
    song.artist_name = file_arr[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    file_arr = filename.split(" - ")
    name_split = file_arr[1].split(".")
    song.name = name_split[0]
    song.artist_name = file_arr[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
