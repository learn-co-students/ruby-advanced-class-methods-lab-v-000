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
    song
  end

  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = self.new_by_name(name)
    @song.save
    @song
  end

  def self.find_by_name(name_to_find)
    Song.all.detect { | song | song.name == name_to_find }
  end

  def self.find_or_create_by_name(name_to_find)
    if Song.find_by_name(name_to_find)
      @song
    else
      Song.create_by_name(name_to_find)
    end
  end

  def self.alphabetical
    array_of_song_names = []
    Song.all.sort_by { | song | song.name }
  end

  def self.new_from_filename

  end

end
