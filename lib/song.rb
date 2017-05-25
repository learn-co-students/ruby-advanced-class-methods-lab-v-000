class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    Song.all << song
    song
  end

  def self.new_by_name(name)
    song=self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.detect{ |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    (self.find_by_name(name) == nil)?  self.create_by_name(name) : self.find_by_name(name)  
  end

  def self.alphabetical
    self.all.sort_by{ |instance| instance.name }
  end

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    name_format = song_data[1].split(".")
    song = self.new_by_name(name_format[0])
    song.artist_name = song_data[0]
    song 
  end

  def self.create_from_filename(filename)
    song_data = filename.split(" - ")
    name_format = song_data[1].split(".")
    song = self.create_by_name(name_format[0])
    song.artist_name = song_data[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

 song = Song.new_from_filename("Thundercat - For Love I Come.mp3")