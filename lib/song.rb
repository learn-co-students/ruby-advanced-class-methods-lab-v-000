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
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song.name
      end
    end
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    data = filename.split(" - ")
    song.name = data[1].split(/(\.mp3)/)[0]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.save
    data = filename.split(" - ")
    song.name = data[1].split(/(\.mp3)/)[0]
    song.artist_name = data[0]
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end