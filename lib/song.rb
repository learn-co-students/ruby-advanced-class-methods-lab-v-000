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
    @song = self.new
    @song.save
    @song
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
    self.all.detect { | song | song.name == name_to_find }
  end

  def self.find_or_create_by_name(name_to_find)
    if self.find_by_name(name_to_find)
      self.find_by_name(name_to_find)
    else
      self.create_by_name(name_to_find)
    end
  end

  def self.alphabetical
    array_of_song_names = []
    self.all.sort_by { | song | song.name }
  end

  def self.new_from_filename(filename)
    song_info = filename.split(/[-.]/)
    artist_name = song_info[0].strip
    name = song_info[1].strip
    @song = self.new
    @song.artist_name = artist_name
    @song.name = name
    @song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
