require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(songName)
    song = self.new
    song.name = songName
    song
  end

  def self.create_by_name(songNmae)
    song = self.new_by_name(songNmae)
    song.save
    song
  end

  def self.find_by_name(songName)
    self.all.detect{|song| song.name == songName}
  end

  def self.find_or_create_by_name(songName)
      self.find_by_name(songName) || self.create_by_name(songName)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(input)

    song = self.new
    data = input.split(" - ")
    song.artist_name = data[0]
    song.name = data[1].split(".")[0]
    song
  end


  def self.create_from_filename(input)
    song = self.new_from_filename(input)
    song.save

  end

  def self.destroy_all
    self.all.clear
  end


  def save
    self.class.all << self
  end



end
