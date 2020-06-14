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
    @@all << song
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
     @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name) 
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    if file_name.end_with?(".mp3")
      split_array = file_name.split(" - ")
        song = self.new
      song.name = split_array[1].chomp(".mp3")
      song.artist_name = split_array[0]
    end
    song
  end

  def self.create_from_filename(file_name)
     if file_name.end_with?(".mp3")
      split_array = file_name.split(" - ")
        song = self.new
      song.name = split_array[1].chomp(".mp3")
      song.artist_name = split_array[0]
    end
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end