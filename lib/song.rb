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
    self.all << self.new
    self.all[-1]
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all[-1]
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    data = filename.split(/\ - |\./)
    new_song = self.new_by_name(data[1])
    new_song.artist_name = data[0]
    new_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
    self.all[-1]
  end

  def self.destroy_all
    self.all.clear
  end

end
