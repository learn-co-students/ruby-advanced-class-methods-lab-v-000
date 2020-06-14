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
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) != nil
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    data = filename[/[^.]+/].split(" -")
    name = data[1].lstrip
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    data = filename[/[^.]+/].split(" -")
    name = data[1].lstrip
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
