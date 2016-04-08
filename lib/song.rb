class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @song = song
  end

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

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

end
