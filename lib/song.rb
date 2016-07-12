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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      return song if song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name)

  end

  def self.alphabetical
    Song.all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split("-")
    arr.each{|element| element.strip!}
    title = arr[-1].split(".")
    title.pop
    arr[-1] = title[0]
    new_song = Song.new
    new_song.name = arr[1]
    new_song.artist_name = arr[0]
    new_song

  end


  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end

end
