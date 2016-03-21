class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def Song.create
  @@all << self
  song = Song.create("The Middle")
Song.all.include?(song) 
end

end
