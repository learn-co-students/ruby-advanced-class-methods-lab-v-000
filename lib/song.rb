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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song

    # doesn't save to @@all array
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end


  def self.find_by_name(name)
    self.all.detect {|title| title.name == name}
  end

  def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) || self.create_by_name(song_name)
    # ???
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    new_filename = filename.split(' - ')
    song = self.new
    song.artist_name = new_filename[0]
    song.name = new_filename[1].gsub(".mp3", "")
    # gsub(pattern, replacement) → new_str
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

    def self.destroy_all
      self.all.clear
    end



end
