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
    @@all << song
    song
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    @@all << song
    song
  end

  def self.find_by_name(name_of_song)
    self.all.detect{|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
    if self.find_by_name(name_of_song)
      self.find_by_name(name_of_song)
    else
      self.create_by_name(name_of_song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|i| i.name}
  end

  def self.new_from_filename(file_name)
    f = file_name.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = f[0]
    song.name = f[1]
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all.clear
  end

end
