class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    result = self.all.detect { |song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create_by_name(title)
  end

  def self.alphabetical
    sorted = self.all.sort_by { |song| song.name  }
    sorted
  end

  def self.new_from_filename(filename)
    song_Array = filename.split(" - ")
    song_Array[1] = song_Array[1].chomp(".mp3")
    song = self.new
    song.name = song_Array[1]
    song.artist_name = song_Array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
