require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = [] #Class varaiable to store all instances for Song

  def self.all #class method
    @@all
  end

  def save #instance method
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(string_name_of_song)
    song = self.new
    song.name = string_name_of_song
    song
  end

  def self.create_by_name(string_name_of_song)
    song = self.new
    song.name = string_name_of_song
    song.save
    song
  end

  def self.find_by_name(string_name_of_song)
    self.all.detect {|title| title.name == string_name_of_song}
  end

  def self.find_or_create_by_name(string_name_of_song)
    if self.find_by_name(string_name_of_song) == nil
      self.create_by_name(string_name_of_song)
    else
      self.find_by_name(string_name_of_song)
    end
  end

  def self.alphabetical
    @@all.sort_by {|w| w.name}
  end

  def self.new_from_filename(mp3_filename)
    song = self.new
    song.name = mp3_filename.split(/[-.]/)[1].strip
    song.artist_name = mp3_filename.split(/[-.]/)[0].strip
    song
  end

  def self.create_from_filename(mp3_filename)
    song = self.new
    song.name = mp3_filename.split(/[-.]/)[1].strip
    song.artist_name = mp3_filename.split(/[-.]/)[0].strip
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
