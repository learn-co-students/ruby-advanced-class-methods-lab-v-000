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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
      existing = self.all.detect{|song| song.name == name }
      if existing == nil
        song = self.new
        song.name = name
        @@all << song
        song
      else
        existing
      end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    filename.chomp!(".mp3")
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
      @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
