require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #=> Class reader
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
    song = self.new #=> Instantiates a song
    song.name = name #=> Calling #name on the song assigns the name argument
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  # def self.find_by_name(name)
  #   result = nil
  #   @@all.each do |song|
  #     result = song if song.name == name
  #   end
  #   result
  # end

  # refactor -> very abstract
  def self.find_by_name(name)
    # find the first song whose name is the name passed as arguement
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(mp3_file)
    song = self.new
    file = mp3_file.split(" - ")
    song.name = file[1]
    song.name.slice!(".mp3")
    song.artist_name = file[0]
    song
  end
  
  def self.create_from_filename(mp3_file)
    song = self.new_from_filename(mp3_file)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
