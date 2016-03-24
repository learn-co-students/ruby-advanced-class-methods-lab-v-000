class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #=>Song.all
    @@all
  end

  def save
    self.class.all << self
    #self #Song Class #all instances of Song << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)

  end

end
