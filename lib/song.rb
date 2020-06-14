require 'pry'
class Song
  attr_accessor :name, :artist_name, :filename_format
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
     song
  end

  def self.new_by_name(name)
     song = self.new
     song.name=(name)
       song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name=(name)
      song
  end

  def self.find_by_name(name)
    self.all.detect {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(attribute)
    artist, song = attribute.split(' - ')
    new_song = song.gsub('.mp3', '')

    song = create_by_name(new_song)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(attribute)
    artist, song = attribute.split(' - ')
    new_song = song.gsub('.mp3', '')

    song = create_by_name(new_song)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
