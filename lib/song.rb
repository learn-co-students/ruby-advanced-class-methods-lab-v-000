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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    prefix = filename.split(".")
    artist_and_name = prefix[0].split(" - ")
    artist = artist_and_name[0]
    name = artist_and_name[1]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
