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
    self.all << song = self.new
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.all << song = self.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect(name) == true
      song
    else
      self.all << song = self.new
      song.name = name
      song
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_values = filename.split(" - ")
    artist_name = song_values[0]
    song_name = song_values[1].gsub(".mp3" , "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_values = filename.split(" - ")
    artist_name = song_values[0]
    song_name = song_values[1].gsub(".mp3" , "")

    self.all << song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
