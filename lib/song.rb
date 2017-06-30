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

  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    song = self.new_by_name(song)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song_data = filename.split(" - ")
    artist = song_data[0]
    song_name = song_data[1].chomp(".mp3")
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
