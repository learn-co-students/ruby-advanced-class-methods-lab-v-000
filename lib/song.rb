require'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    self.all << song
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
    @@all <<song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|match| name == match.name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|key| key.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.split(" - ")
    song_name = split_filename[1].split(".")
    song.name = song_name[0]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    split_filename = filename.split(" - ")
    song_name = split_filename[1].split(".")
    song.name = song_name[0]
    song.artist_name = split_filename[0]
    self.all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
