class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.name = name
    song.artist_name = name
    @@all << song
    song
  end

  def save
    self.class.all << self
  end

end
