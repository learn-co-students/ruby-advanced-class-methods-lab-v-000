require "pry"
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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |songs|
      songs.name == name
    end
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    #  binding.pry
    @@all.sort_by { |word| word.name.downcase }
  end

  def self.new_from_filename(filename)
    song_split = filename.split(" - ")
    name = song_split[1].chomp(".mp3")
    artist_name = song_split[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
