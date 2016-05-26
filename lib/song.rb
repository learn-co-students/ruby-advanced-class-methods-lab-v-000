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
    self.all << song
    song
  end
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song
  end
  def self.new_from_filename(filename)
    song_info = filename.split(/( - |\.)/)
    song = self.new_by_name(song_info[2])
    song.artist_name = song_info[0]
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end
  def self.find_by_name(song_name)
    self.all.find do |song|
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
    self.all.sort_by do |song|
      song.name
    end
  end
  def self.destroy_all
    @@all.clear
  end
end
