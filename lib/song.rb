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
    fred = self.new
    fred.name = name
    @@all << fred

    fred
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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    songs = @@all.sort_by { |i| i.name}
    songs
  end

  def self.new_from_filename(file)
    song = self.new
    file.chomp!(".mp3")
    file.split
    new_song = file.split(" - ")
    song.artist_name = new_song[0]
    song.name = new_song[1]
    song
  end

  def self.create_from_filename(create)
    create = self.new_from_filename(create)
    @@all << create
  end

  def self.destroy_all
    @@all.clear
  end
end
