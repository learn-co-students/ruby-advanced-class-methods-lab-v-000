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
    self.all << song
    song
  end

  def self.new_by_name(song)
    s = self.create
    s.name = song
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    @@all << s
    s
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    data = filename.split(" - ")
    artist = data[0]
    name = data[1]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    filename.chomp!(".mp3")
    data = filename.split(" - ")
    artist = data[0]
    name = data[1]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end


end
