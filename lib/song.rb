class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.select { |song| song.name == name }.first
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(name)
    song_data = name.split('-')
    song_artist = song_data.first.strip
    song_name = song_data.last.split('.').first.strip
    song = self.new_by_name(song_name)
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
