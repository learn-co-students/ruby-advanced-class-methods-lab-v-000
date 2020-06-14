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
    song = self.new #or song = new
    song.save #"@@all << song" works too
    song
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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song_name| song_name.name}
  end

  def self.new_from_filename(file)
    pieces = file.split(" - ")
    artist_name = pieces[0]
    song_title = pieces[1].split(".")[0]
    #song_title = pieces[1].gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = song_title
    song
  end

  def self.create_from_filename(file)
    pieces = file.split(" - ")
    artist_name = pieces[0]
    song_title = pieces[1].split(".")[0]

    song = self.create
    song.artist_name = artist_name
    song.name = song_title
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
