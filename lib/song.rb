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
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name  == name}

  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)  || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(from_file)
    data = from_file.split(" - ")
    artist_name = data[0]
    name = data[1]
    song = self.new # This is an important line.
    song. artist_name = artist_name
    song.name = name
    song.save
    song
  end

  def create_from_filename
  end

  def self.destroy_all
    self.all.clear
  end
end
Song.create
