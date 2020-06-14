class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    result == nil ? self.create_by_name(name) : result
  end

  def self.new_from_filename(filename)
    song = self.create
    song.artist_name = filename.split(" - ").first
    song.name = filename.split(" - ").last.chomp(".mp3")
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def save
    self.class.all << self
  end

end
