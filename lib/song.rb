require "pry"

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
    self.all.detect{|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    found_name = self.find_by_name(name)
    if !found_name
      self.create_by_name(name)
    else
      found_name
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    parsed = filename.split(" - ")
    parsed[1].slice!(".mp3")
    song.artist_name = parsed[0]
    song.name = parsed[1]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end


end
