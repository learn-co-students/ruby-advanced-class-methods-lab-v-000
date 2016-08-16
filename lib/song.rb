class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    song = @@all.detect{|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = @@all.detect{|song| song.name == name}
    if song == nil
      create_by_name(name)
    else
      song
    end
  end

  def self.destroy_all
    @@all = []
  end

  def self.alphabetical
    songs = @@all.sort{|a,b| a.name <=> b.name}
    songs
  end

  def self.new_from_filename(filename)
    song = self.new
    track_and_ext = filename.split(".")
    track = track_and_ext[0]
    ext = track_and_ext[1]
    artist_and_songname = track.split(" - ")
    artist = artist_and_songname[0]
    songname = artist_and_songname[1]
    song.name = songname
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    track_and_ext = filename.split(".")
    track = track_and_ext[0]
    ext = track_and_ext[1]
    artist_and_songname = track.split(" - ")
    artist = artist_and_songname[0]
    songname = artist_and_songname[1]
    song.name = songname
    song.artist_name = artist
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
