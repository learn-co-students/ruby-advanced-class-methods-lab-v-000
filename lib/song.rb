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

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    artist_song = parse_filename(filename)
    song = self.new_by_name(artist_song[:song_name])
    song.artist_name = artist_song[:artist_name]
    song
  end

  def self.create_from_filename(filename)
    artist_song = parse_filename(filename)
    song = self.create_by_name(artist_song[:song_name])
    song.artist_name = artist_song[:artist_name]
    song
  end

  def self.parse_filename(filename)
    artist_song = filename.split(" - ")
    {
      song_name: artist_song[1].chomp(".mp3"),
      artist_name: artist_song[0],
    }
  end

  def self.destroy_all
    self.all.clear
  end

end
