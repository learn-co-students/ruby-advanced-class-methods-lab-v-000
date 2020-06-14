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
    song = self.new
    song.save
    song
    # new_song.name = name
    # new_song.artist_name = artist_name
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
      song_info = filename.split(/[-.]/)
      song_info.pop
      song_info = song_info.collect{|x| x.strip!}
      song = self.new_by_name(song_info[1])
      song.artist_name = song_info[0]
      song
  end

  def self.create_from_filename(filename)
      song_info = filename.split(/[-.]/)
      song_info.pop
      song_info = song_info.collect{|x| x.strip!}
      song = self.create_by_name(song_info[1])
      song.artist_name = song_info[0]
      song
  end

  def self.destroy_all
    @@all.clear
  end
end
