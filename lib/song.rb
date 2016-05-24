class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.create(song)
    @@all << song
    song
  end




  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end








