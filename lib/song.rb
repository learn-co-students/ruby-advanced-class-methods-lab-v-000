class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}
  end

  def self.normalize_filename(filename)
    filename = filename.split(/[-\.]/)
    filename.pop
    {:name => filename.last.strip, :artist => filename.first.strip}
  end

  def self.new_from_filename(filename)
    filename = self.normalize_filename(filename)
    song = self.new
    song.name = filename[:name]
    song.artist_name = filename[:artist]
    song
  end

  def self.create_from_filename(filename)
    filename = self.normalize_filename(filename)
    song = self.new
    song.name = filename[:name]
    song.artist_name = filename[:artist]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
