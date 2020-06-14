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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(song_to_find)

    match = @@all.detect do |title|
      if song_to_find == title.name
        title
      end
    end
    match
  end

  def self.find_or_create_by_name(title)
    match = self.find_by_name(title)
    if !match
        match = self.create_by_name(title)
    end
    match
  end

  def self.alphabetical
    sorted = []

    sorted = @@all

    sorted = sorted.sort_by { |i| i.name }

    sorted.each {|title| puts title}
  end

  def self.new_from_filename(file_name)
    parsed = file_name.split("-")

    artist = parsed[0].lstrip.rstrip
    title = parsed[1]
    title = title.lstrip.rstrip

    title = title[0..-5]
    title.lstrip.rstrip

    song = Song.new
    song.artist_name = artist
    song.name = title
    song

  end

  def self.create_from_filename(file_name)
    # parsed = file_name.split("-")
    #
    # artist = parsed[0].lstrip.rstrip
    # title = parsed[1]
    # title = title.lstrip.rstrip
    #
    # title = title[0..-5]
    # title.lstrip.rstrip
    #
    # song = Song.new
    # song.artist_name = artist
    # song.name = title
  song =   self.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
