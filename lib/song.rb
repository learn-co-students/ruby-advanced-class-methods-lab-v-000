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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select {|song| name == song.name}[0]
  end

  def self.find_or_create_by_name(name)
    existing_song = Song.find_by_name(name)
    if existing_song
      return existing_song
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
     @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    split_filename = filename.split(" - ")
    artist_name  = split_filename[0]
    name  = split_filename[1]
    song = Song.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
