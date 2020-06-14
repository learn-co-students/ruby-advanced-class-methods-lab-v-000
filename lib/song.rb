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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song_1 = self.new
    new_song_1.name = name
    new_song_1.save
    new_song_1
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
   @@all.sort_by do |song|
     song.name
   end
  end
  def self.new_from_filename(filename)
    row = filename

      data = row.split(" - ")
      artist_name = data[0]
      song_name = data[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  def self.destroy_all
  @@all.clear
end

end
