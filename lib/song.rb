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

  def self.create  #.create added and tested green
    @@all << self.new
    @@all[@@all.length-1]
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
    @@all[@@all.length-1]
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    #given "Firstname Lastname - Songtitle.mp3", should turn into song.name => "Songtitle" and song.artist_name => "Firstname Lastname"
    #split the parts and remove the .mp3, -, and spaces
    x = filename.split('-')
    artist_name = x[0].chomp(' ')
    name = x[1].chomp('.mp3').lstrip
    # binding.pry
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    x = filename.split('-')
    artist_name = x[0].chomp(' ')
    name = x[1].chomp('.mp3').lstrip
    # binding.pry
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end #end of class
