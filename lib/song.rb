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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)
    ary = song.split(/\s-\s|\./)
    newsong = self.new_by_name(ary[1])
    newsong.artist_name = ary[0]
    newsong
  end

  def self.create_from_filename(song)
    newsong = self.new_from_filename(song)
    self.all << newsong
    newsong
  end

  def self.destroy_all
    self.all.clear
  end

end

newsong = Song.new_from_filename("Thundercat - For Love I Come.mp3")
