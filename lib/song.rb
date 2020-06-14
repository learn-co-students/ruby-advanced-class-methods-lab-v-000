class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create
    (self.new).save
  end

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.create
    new_song.name = song
    new_song
  end

  def self.find_by_name(song)
    self.all.detect { |s| s.name == song }
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) != nil
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    song = filename.sub /([.]+?\S+\Z)/, ""
    song = song.split(" - ")
    new_song = self.new_by_name(song[1])
    new_song.artist_name = song[0]
    new_song
  end

  def self.create_from_filename(filename)
    song = filename.sub /([.]+?\S+\Z)/, ""
    song = song.split(" - ")
    new_song = self.create_by_name(song[1])
    new_song.artist_name = song[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
