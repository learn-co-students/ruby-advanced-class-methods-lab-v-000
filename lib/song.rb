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
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.all.include?(song_name)
      return song_name
    else
      song = self.create
      song.name = song_name
      song
    end
  end

  def self.alphabetical
    self.all.sort_by {|songname| songname.name.downcase}
  end

  def self.new_from_filename(filename)
    song_artist = filename.split(" - ")
    artist_name = song_artist[0]
    song_name = song_artist[1]
    song_name = song_name.split(".")[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_artist = filename.split(" - ")
    artist_name = song_artist[0]
    song_name = song_artist[1]
    song_name = song_name.split(".")[0]

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end

end
