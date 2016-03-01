class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

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

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end


  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)|| self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #custom constructor
    file = filename.split(" - ")
    name = file[1].sub(".mp3", "")
    artist_name = file[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    #self.new_from_filename(filename)
    file = filename.split(" - ")
    name = file[1].sub(".mp3", "")
    artist_name = file[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
