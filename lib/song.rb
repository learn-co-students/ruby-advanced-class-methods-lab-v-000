
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
    #self.new.save wouldve done that to replace the first two lines but dunno if you can return the song without assigning it first
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #song.save   hmmm maybe we arent supposed to save the song within this method
    song

    #binding.pry
    #self.all.last.name = name
    #difference between self.class.all and self.all?
    #oh in this case self.all is a class method that we've made where self.class.all is the literal representation of the collection of instances for a class


    #OKAY the issue seemed to have cleared when including a return for the song
    #maybe the test was looking for you to return that
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song

  end

  def self.find_by_name(name)
    self.all.select {|song| song.name == name}.first
    #sometimes it's a little weird seeing a chained method after a block
  end

  def self.find_or_create_by_name(name)
    if !self.all.select {|song| song.name == name}.empty?
    #is there a way to do this with include? pass the same block to include? maybe?
      return self.all.select {|song| song.name == name}.first
      #prob should just wrap this code somewhere else so you dont keep typing it out like this
    else
      song = self.create_by_name(name)
      return song
    end
  end

  def self.alphabetical
    return self.all.sort {|song1,song2| song1.name <=> song2.name}
    #at first this wasnt working but now it does eh? well that was before the "return" was there
  end

  def self.new_from_filename(filename)
    parts = filename.split("-")
    artist = parts.first.strip
    song_name = parts.last.strip
    song = self.new
    song.artist_name = artist
    song.name = song_name[0..-5] #to cut off the file extension .mp3...but obviously not ideal

    song
  end

  def self.create_from_filename(filename)
    parts = filename.split("-")
    artist = parts.first.strip
    song_name = parts.last.strip
    song = self.new
    song.artist_name = artist
    song.name = song_name[0..-5]
    song.save
    song

  end

  def self.destroy_all
    @@all = []
  end


end
