class Song
  attr_accessor :artist_name, :name

  @@all = []

  def self.create
    song = self.new
    song.save
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

  def self.alphabetical
    songs = @@all.collect do |song|
      song.name
    end
    songs.sort! do |a, b|
      a <=> b
    end
    songs.collect do |song|
      self.find_by_name(song)
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(songname)
    song = self.new
    songname.slice!(".mp3")
    song.name = songname.split(" - ")[1]
    song.artist_name = songname.split(" - ")[0]
    song
  end

  def self.create_from_filename(songname)
    song = self.new
    songname.slice!(".mp3")
    song.name = songname.split(" - ")[1]
    song.artist_name = songname.split(" - ")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
