
require'pry'

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
   self.all << song
   song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
      song = self.new_by_name(title)
      self.all << song
      song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      if song.name == title
        title
      end
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      song = self.find_by_name(title)
      song.name = title
      song
    else self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(filename)
    string = filename.split(/\.|-/)

    artist_name = string[0].rstrip
    name = string[1].lstrip

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end


end
