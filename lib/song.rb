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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |i| i.name }
  end

  def self.new_from_filename(filename)
    artist_name_s = filename.split(" - ")[0]
    name_s = filename.split(/\ - |\./)[1]
    song = self.new
    song.name = name_s
    song.artist_name = artist_name_s
    song
  end

  def self.create_from_filename(filename)
    artist_name_s = filename.split(" - ")[0]
    name_s = filename.split(/\ - |\./)[1]
    song = self.create
    song.name = name_s
    song.artist_name = artist_name_s
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
