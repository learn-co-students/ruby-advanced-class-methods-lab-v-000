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
    @@all << song
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
    find = name
    self.all.each do |song| 
      song.name.scan(find) {|name| return song}
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == [] ? self.create_by_name(name) :  self.find_by_name(name)
  end

  self.find_or_create_by_name(name)

  def self.alphabetical
    sorted = self.all.sort_by! {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)  
    filename = filename
    song = self.new
    name = filename.scan(/\w+?\s?\w+?\s?\w+?\s?\w+?\s?\w+\s?[.]/).join("").delete "."
    artist = filename.scan(/\w+?\s?\w+?\s?\w+?\s?\w+?\s?\w+\s?[-]/).join("").delete " -"
    song.name = name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    filename = filename
    song = self.new
    song_name = filename.scan(/\w+?\s?\w+?\s?\w+?\s?\w+?\s?\w+\s?[.]/).join("").delete "."
    artist = filename.scan(/\w+?\s?\w+?\s?\w+?\s?\w+?\s?\w+\s?[-]/).join("").delete " -"
    song.name = song_name
    song.artist_name = artist
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end



