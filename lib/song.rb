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

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.collect do |song|
      return song if song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song != []
      return song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    artist_array = filename.split('-')
    song.artist_name = artist_array[0]
    song.artist_name.strip!
    song_array = artist_array[1].split('.')
    song.name = song_array[0]
    song.name.strip!
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
