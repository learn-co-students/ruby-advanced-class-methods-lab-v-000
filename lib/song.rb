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
        song = self.new  # instantiate a new song
        song.save   # call the save method
        song     #return the song
  end

  def self.new_by_name(song_name)
    song = self.new   # instantiate
    song.name = song_name    # naming
    song
  end

  def self.create_by_name(song_name)
      song = self.create  # instantiate
      song.name = song_name
      song
  end

  def self.find_by_name(song_name)
      self.all.detect do |song|
        song.name == song_name
      end
  end

  def self.find_or_create_by_name(song_name)  # you dont want to create a new one here. Instead you want
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
        song.name
    end
  end

    def self.new_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.new
     song.name = song_name
     song.artist_name = artist_name
     song
   end

  def self.create_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song

  end

  def self.destroy_all
      @@all = []
  end

end
