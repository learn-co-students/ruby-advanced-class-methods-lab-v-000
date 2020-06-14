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
    song = self.new
    song.name = name
    #song.save #is this method need here?
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_with_song = filename.split(/[-\.]/)
    song = self.new
    #song = self.create_by_name(artist_with_song[1])
    song.name = artist_with_song[1].strip
    song.artist_name = artist_with_song[0].strip
    song
  end

  def self.create_from_filename(filename)
    artist_with_song = filename.split(/[-\.]/)
    song = self.create
    #song = self.create_by_name(artist_with_song[1])
    song.name = artist_with_song[1].strip
    song.artist_name = artist_with_song[0].strip
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
