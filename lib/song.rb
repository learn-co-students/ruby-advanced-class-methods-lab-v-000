require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def initialize
    #instance scope"
  end

  def self.all
    @@all
  end

  def self.create # extension of initialize
    s = self.new
    s.save
    s
  end

  # Song.new_from_name("Jessie's Girl")
  def self.new_by_name(name) # Constructor
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      s.name
    else
      s = self.new
      s.name = name
      s.save
      s
    end
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(mp3_data)
    sep_data = mp3_data.split(" - ")
      artist_name = sep_data[0]
      name = sep_data[1]
      name = name.sub(/.mp3/, "")
      s = self.new
      s.name = name
      s.artist_name = artist_name
      s
  end

  def self.create_from_filename(mp3_data)
    sep_data = mp3_data.split(" - ")
      artist_name = sep_data[0]
      name = sep_data[1]
      name = name.sub(/.mp3/, "")
      s = self.new
      s.name = name
      s.artist_name = artist_name
      s.save
      s
  end

  def self.destroy_all
    self.all.clear
  end

end
