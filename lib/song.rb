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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name=song_name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    holder = filename.split(" - ")
    artist_name = holder[0]
    song_name = holder[1].slice(0..-5)

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(filename)
    holder = filename.split(" - ")
    artist_name = holder[0]
    song_name = holder[1].slice(0..-5)

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
