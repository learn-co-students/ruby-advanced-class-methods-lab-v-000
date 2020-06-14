class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

def self.name
  name = @name
end

  def save
  # @@all << self
    #song.save
    self.class.all << self
  end

  def self.create
    song = self.new
    #song = @@all
    song.save
    return song
    #return true
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    #puts "blank space"
  return song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
    #song = Song.create
    #Song.all.include?(name)
  end

  def self.alphabetical
    @@all.sort_by { |s| s.name }
  end

  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(/ - |\./)
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    return song
  end

  def self.destroy_all
    @@all = []
  end
end
