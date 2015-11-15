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
    new_song.name= song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.save
    new_song.name= song_name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end  

  def self.alphabetical
    self.all.sort_by{|a| a.name}
  end

  def self.new_from_filename(file)

    data = file.scan(/[^-.]+/)
    artist = data[0].strip
    title = data[1].strip

    new_song = self.new_by_name(title)
    new_song.artist_name = artist

    new_song

  end

  def self.create_from_filename(file)

    data = file.scan(/[^-.]+/)
    artist = data[0].strip
    title = data[1].strip

    new_song = self.create_by_name(title)
    new_song.artist_name = artist

    new_song

  end

  def self.destroy_all
    self.all.clear
  end


end







