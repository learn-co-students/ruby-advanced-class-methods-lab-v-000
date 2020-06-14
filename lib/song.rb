require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song=self.new
    @@all<<song
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
    @@all<<song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if
      !self.find_by_name(name)
      song = self.new
      song.name = name
      @@all<<song
      song
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file_name)
    file_name_split = file_name.split(" - ")
    song=self.new
    song.name = file_name_split[1].chomp(".mp3")
    song.artist_name = file_name_split[0]
    song
  end

  def self.create_from_filename(file_name)
    file_name_split = file_name.split(" - ")
    song=self.new
    song.name = file_name_split[1][0...-4]
    song.artist_name = file_name_split[0]
    @@all<<song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
