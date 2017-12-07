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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort{|a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    arr = filename.split(/[\-\.]/)
    artist_name = arr[0].to_s.strip
    song_name = arr[1].to_s.strip
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    arr = filename.split(/[\-\.]/)
    artist_name = arr[0].to_s.strip
    song_name = arr[1].to_s.strip
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
