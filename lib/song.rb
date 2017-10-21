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
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless self.find_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_artist)
    song = song_artist.split(/[-.]/).map(&:strip)
    new_song = self.new
    new_song.artist_name = song[0]
    new_song.name = song[1]
    new_song
  end

  def self.create_from_filename(song_artist)
    new_song = self.new_from_filename(song_artist)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
