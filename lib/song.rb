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

  end

  def self.create_by_name(song_name)
    song = self.create
    # binding.pry
    song.name = song_name
    # binding.pry
    song
    # binding.pry
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|j| j.name }
  end

  def self.new_from_filename(filename)
    split_em_up = filename.split("-").map{|x| x.chomp}
    compact_artist = split_em_up.map!{|x| x.lstrip}[0].strip!
    compact_song = split_em_up[1].gsub(".mp3","")
    song = self.new
    song.name = compact_song
    song.artist_name = compact_artist
    song
  end

  def self.create_from_filename(filename)
    split_em_up = filename.split("-").map{|x| x.chomp}
    compact_artist = split_em_up.map!{|x| x.lstrip}[0].strip!
    compact_song = split_em_up[1].gsub(".mp3","")
    song = self.create
    song.name = compact_song
    song.artist_name = compact_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
