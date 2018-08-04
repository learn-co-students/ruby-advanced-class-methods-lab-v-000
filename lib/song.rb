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
  def self.new_by_name(new_song)
    song = self.new
    song.name = new_song
    song
  end
  def self.create_by_name(the_name)
    song = self.new
    song.name = the_name
    song.save
    song
  end
  def self.find_by_name(name)

    self.all.find{|song| song.name == name }
  end
  def self.find_or_create_by_name(new_song)
    if self.find_by_name(new_song) != nil
       self.find_by_name(new_song)
    else
    self.create_by_name(new_song)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(song_string)
    song = self.new
    array = song_string.chomp(".mp3").split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    song
  end
  def self.create_from_filename(song_string)
    song = self.new
    array = song_string.chomp(".mp3").split(" - ")
    song.artist_name = array[0]
    song.name = array[1]
    song.save
  end
  def self.destroy_all
    self.all.clear
  end
end
