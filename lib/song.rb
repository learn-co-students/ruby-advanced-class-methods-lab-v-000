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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    !!self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.chomp(".mp3").split(/ - /)
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(filename)
    data = filename.chomp(".mp3").split(/ - /)
    artist_name = data[0]
    name = data[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
