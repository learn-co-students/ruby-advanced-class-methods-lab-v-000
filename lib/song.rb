class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.all << Song.new
    self.all[-1]
  end

  def self.new_by_name(string)
    newSong = Song.new
    newSong.name = string
    newSong
  end

  def self.create_by_name(string)
    self.all << self.new_by_name(string)
    self.all[-1]
  end

  def self.find_by_name(string)
    self.all.find { |song| song.name == string }
  end

  def self.find_or_create_by_name(string)
    self.all.find(self.create_by_name(string)) { |song| song.name == string }
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1].chomp!(".mp3")
    newSong = Song.new
    newSong.artist_name = array[0]
    newSong.name = array[1]
    newSong
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
    self.all[-1]
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
