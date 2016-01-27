class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song

  end


  def save
    self.class.all << self
  end
end