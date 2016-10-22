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
    Song.all << song
    song
  end

  def self.alphabetical
    self.all.sort_by { |data| data.name }
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new
    song.name = data[1].split(".").first
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    Song.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
       self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.destroy_all
    self.all.clear
  end

end
