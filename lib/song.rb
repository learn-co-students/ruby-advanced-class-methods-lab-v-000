class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.create
    song = Song.create
    song.name = name
    @@all << name
  end

  def self.destroy_all
    self.all.clear
  end
end
