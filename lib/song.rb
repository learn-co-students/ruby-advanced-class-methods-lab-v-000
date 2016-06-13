class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create  #class constructor initializes a song and saves it to the @@all class variable
    song = Song.new
    @@all << song
    return song
  end

  def Song.new_by_name
    song.name =name
    return song.name
  end

end
