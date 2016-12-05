class Song
  attr_accessor :name, :artist_name
  @@all = []

  def inialize(name, artist_name)
    @name=name
    @artist_name=artist_name
    @@all << self
    song.create
    song.new_by_name

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song)
    name << song
    song.name
  end

end
