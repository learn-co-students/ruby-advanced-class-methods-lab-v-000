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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless self.all.include?(name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    artist_song = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = artist_song.first
    song.name = artist_song.last
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end
