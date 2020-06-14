
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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    need_saving = self.new_by_name(title)
    need_saving.save
    need_saving
    end

  def self.find_by_name(title)
    self.all.find {|x| x.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file)
    song = file.split(".mp3").join
    array = song.split(" - ")
    artist_name = array[0]
    name = array[1]
    song_ready = self.new
    song_ready.artist_name = artist_name
    song_ready.name = name
    song_ready
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end

  def self.destroy_all
      self.all.clear
    end
end
