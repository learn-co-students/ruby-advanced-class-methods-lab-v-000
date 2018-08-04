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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song|song.name}
  end

  def self.new_from_filename(filename)
    artist_and_name = filename.split(" - ")
    artist_name = artist_and_name[0]
    name = artist_and_name[1].sub(/.mp3/, "")
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

   def self.create_from_filename(filename)
    artist_and_name = filename.split(" - ")
    artist_name = artist_and_name[0]
    name = artist_and_name[1].sub(/.mp3/, "")
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
