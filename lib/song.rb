class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(new_song)
  	song = self.new
  	song.self.name=new_song
  	song.save
  	song
  end
end
