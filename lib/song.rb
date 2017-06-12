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
    now = self.new
    @@all << now
    now
  end

  def self.new_by_name(name)
    now = self.new
    now.name= name
    now
  end

  def self.create_by_name(name)
    now = self.new_by_name(name)
    @@all << now
    now
  end

  def self.find_by_name(name)
    @@all.detect {|x| x.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name)
    file = name.split(" - ")
    artist = file[0]
    song_name = file[1].slice(0..-5)
    now = self.new
    now.name = song_name
    now.artist_name = artist
    now
  end

  def self.create_from_filename(name)
    file = name.split(" - ")
    artist = file[0]
    song_name = file[1].slice(0..-5)
    now = self.new
    now.name = song_name
    now.artist_name = artist
    @@all << now
    now
  end

  def self.destroy_all
    @@all = []
  end

end
