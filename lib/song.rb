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
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    res = self.all.sort_by do |song|
      song.name
    end
    res
  end

  def self.new_from_filename(name)
    parts = name.split("-").collect{|n| n.strip}
    parts[1] = parts[1].split(".")[0]
    song = Song.new
    song.name = parts[1]
    song.artist_name = parts[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
