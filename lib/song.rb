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
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.detect { |song| song.name == name}
    else 
      song = self.new
      song.name = name
      song
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file_array = filename.gsub(/.mp3/, "").split(" - ")
    song = self.new
    song.artist_name = file_array[0]
    song.name = file_array[1] 
    song
  end

  def self.create_from_filename(filename)
    file_array = filename.gsub(/.mp3/, "").split(" - ")
    song = self.new
    song.artist_name = file_array[0]
    song.name = file_array[1] 
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
