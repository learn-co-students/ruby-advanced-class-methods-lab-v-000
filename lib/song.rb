class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name = nil, artist_name = nil)
    @name = name if name
    @artist_name = artist_name if artist_name
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|title| title.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by!{|n| n.name }
  end

  def self.new_from_filename(filename)
    file_artist = filename.split(" - ")[0]
    file_song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = file_song_name
    song.artist_name = file_artist
    song
  end

  def self.create_from_filename(song_name)
    if song_name.include?(".mp3")
      song = self.new
      artist_and_song_array = song_name.split(" - ")
      song.name = artist_and_song_array[1].chomp(".mp3")
      song.artist_name = artist_and_song_array[0]
      self.all << song
      song
    end
  end

  def self.destroy_all
    self.all.clear
  end


end
