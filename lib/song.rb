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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|songs| songs.name}
  end

  def self.new_from_filename(filename)
    row = filename.split(" - ")

    artist_name = row[0]

    artist_extension = row[1]
    extension_split = artist_extension.split(".")

    song_name = extension_split[0]

    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist_name

    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save

    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
