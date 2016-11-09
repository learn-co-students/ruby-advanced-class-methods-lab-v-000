require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_string_name)
    song = self.new
    song.name = song_string_name
    song
  end

  def self.create_by_name(song_string_name)
    song = self.new_by_name(song_string_name)
    song.save
    song
  end

  def self.find_by_name(song_string_name)
    self.all.detect{|w| w.name == song_string_name}
  end

  def self.find_or_create_by_name(song_string_name)
    if self.find_by_name(song_string_name) == nil
      self.create_by_name(song_string_name)
    else
      return self.find_by_name(song_string_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|w| w.name}
  end

  def self.new_from_filename(song_string_name)
    song = self.new
    song_array = song_string_name.split("-").collect{|w| w.strip}
    song.name = song_array[1].gsub(/[.]mp3/, "")
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(song_string_name)
    song = self.new_from_filename(song_string_name)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end



  def save
    self.class.all << self
  end

end
