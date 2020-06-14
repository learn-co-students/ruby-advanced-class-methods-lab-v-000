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
  end

  def self.new_by_name(song_name)
    song=self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song=self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|instance| instance.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)== nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(file)
    array = file.split("-")
    artist_name =array[0].strip
    name=array[1].split(".")[0].strip
    song = self.new
    song.name=name
    song.artist_name=artist_name
    song
  end

  def self.create_from_filename(file)
    array = file.split("-")
    artist_name =array[0].strip
    name=array[1].split(".")[0].strip
    song = self.new
    song.name=name
    song.artist_name=artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
