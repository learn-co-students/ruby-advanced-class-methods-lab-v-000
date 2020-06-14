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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
   song.name = title
   song
    # name = Song.name
# song = song.new_by_name(name)
# song.name = name
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song.save
    song

  end

  def self.find_by_name(title)
    self.all.detect{|song|song.name == title}
  end

  def self.find_or_create_by_name(title)
    a = self.find_by_name(title)
    if a == nil
      self.create_by_name(title)
    else
      a
    end

  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(song)

    data = song.split(" - ")
    artist = data[0]
    name = data[1].gsub(".mp3","")
    a = self.new
    a.name = name
    a.artist_name = artist
    a
  end

  def self.create_from_filename(song)
    self.new_from_filename(song).save
  end

  def self.destroy_all
    @@all.clear

  end
end
