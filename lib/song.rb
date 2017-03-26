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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_properties = filename.chomp('.mp3').split(' - ')
    artist_name = song_properties[0]
    name = song_properties[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
