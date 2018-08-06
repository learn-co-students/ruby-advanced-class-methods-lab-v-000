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
    song = self.new # self refers to the Song class. This is Song.new
    song.save # saves to @@all
    song # returns song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name #sets attr_accessor .name to the variable song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|name| name.name == song_name} #returns the song_name whenever it finds a match in the array
  end

  def self.find_or_create_by_name
  end

  def self.alphabetical
  end

  def self.new_from_filename
  end

  def self.create_from_filename
  end

  def self.destroy_all
    self.all.clear #why not self.class.clear?
  end

end
