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

  def self.new_by_name(names)
    song = self.new
    song.name = names
    song
  end

  def self.create_by_name(names)
    song = self.create
    song.name = names
    song
  end

  def self.find_by_name(names)
    self.all.detect{|s| s.name == names}
  end

  def self.find_or_create_by_name(names)
    self.find_by_name(names) || self.create_by_name(names)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(names)
    divide = names.split(" - ")
    artist_name = divide[0]
    song_name = divide[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(names)
    divide = names.split(" - ")
    artist_name = divide[0]
    song_name = divide[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
