class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
   def self.find_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all.each do |the_song|
      if the_song == song_name
        the_song
      end
      song
  end
end

end

