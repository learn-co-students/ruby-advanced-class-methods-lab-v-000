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
    c = self.new
    c.save
    c
  end

  def initialize

  end

  def self.new_by_name(name)
    n = self.new
    n.name = name
    n
  end

  def self.create_by_name(name)
    n = self.new
    n.name = name
    @@all << n
    n
  end

  def self.find_by_name(name)
    @@all.detect {|n| n if n.name == name}

  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|n| n.name}
  end

  def self.new_from_filename(filename)
    n = self.new
    f = filename.sub(/(.mp3)/, "").split(" - ")
    artist_name = f[0]
    song_name = f[1]
    n.artist_name = artist_name
    n.name = song_name
    n

  end

  def self.create_from_filename(filename)
    n = self.new
    f = filename.sub(/(.mp3)/, "").split(" - ")
    artist_name = f[0]
    song_name = f[1]
    n.artist_name = artist_name
    n.name = song_name
    n.save

  end

  def self.destroy_all
    @@all = []
    end
end
