class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new
    song.artist_name = data[0]
    song.name = data[1].sub(".mp3", "")
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new
    song.artist_name = data[0]
    song.name = data[1].sub(".mp3", "")
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if !song = self.find_by_name(name)
      new_song = self.create_by_name(name)
      return new_song
    end
    song
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
