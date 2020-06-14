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
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self. alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    newname = filename.split(/\s\-\s|\./)
    song = self.new
    song.artist_name = newname[0]
    song.name = newname[1]
    song
  end

  def self.create_from_filename(filename)
    newname = filename.split(/\s\-\s|\./)
    song = self.new
    song.artist_name = newname[0]
    song.name = newname[1]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
