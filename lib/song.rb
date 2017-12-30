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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect do |song_instance|
      if song_instance.name == song_name
        song_instance
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    binding.pry
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
  end

  def self.new_from_filename
  end

  def self.create_from_filename
  end

  def self.destroy_all
    self.all.clear
  end

end
