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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |songs| songs.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    name = data[1].chomp(".mp3")
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
