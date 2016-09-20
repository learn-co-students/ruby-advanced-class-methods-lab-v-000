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
    next_song = self.new
    next_song.save
    next_song
  end

  def self.new_by_name(name)
    next_song = self.new
    next_song.name = name
    next_song
  end

  def self.create_by_name(name)
    next_song = self.new_by_name(name)
    next_song.save
    next_song
  end

  def self.find_by_name(name)
    self.all.detect { |by_name| by_name.name == name}
  end

  def self.find_or_create_by_name(name)
    self.all.include?(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |sort| sort.name.downcase}
  end

  def self.new_from_filename(filename)
    pre = filename.split(".")
    artist_with_name = pre[0].split(" - ")
    artist = artist_with_name[0]
    name = artist_with_name[1]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
