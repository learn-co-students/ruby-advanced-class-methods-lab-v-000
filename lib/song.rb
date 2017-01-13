require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def initialize
    @artist_name = artist_name
  end # of initialize


  def self.all
    @@all
  end # of self.all


  def save
    self.class.all << self
  end # of save 


  def self.create
    song = self.new
    song.name = name
    song.save
    song 
  end # of self.create


  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end # of self.new_by_name


  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song  
  end # of self.create_by_name


  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end # of self.find_by_name
    

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end # of if 
  end # of self.find_or_create_by_name


  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end # of self.alphabetical

  def self.new_from_filename(filename)
    data = filename.split("-")
    song = data[1].split(".mp3").join(" ").strip
    artist_name = data[0].strip
    self.new_by_name(song)
  end # of self.new_from_filename


end # of class 
