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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
    #self.all.detect{|s| s == song}
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song

    #song = self.create
    #song.name = song_name
    #song
  end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|srtd| srtd.name}
  end

  def self.new_from_filename(file)
    splitedarr = file.split(/\s*-\s*/)

    artist = splitedarr[0]
    song = splitedarr[1].gsub(".mp3", "")

    songgg = Song.new
    songgg.name = song
    songgg.artist_name = artist

    return songgg
  end

  def self.create_from_filename(file)
    songgg = self.new_from_filename(file)

    songgg.save
    songgg
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
