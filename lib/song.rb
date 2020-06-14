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
    self.all << self.new
    self.all[-1]
  end

  def self.new_by_name(track)
    song = self.new
    song.name = track
    song
  end

  def self.create_by_name(track)
    song = self.new_by_name(track)
    song.save
    song
  end

  def self.find_by_name(track)
    self.all.detect {|song| song.name == track}
  end

  def self.find_or_create_by_name(track)
    self.find_by_name(track) || self.create_by_name(track)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    artist = file.split(" - ")[0]
    title = file.split(" - ")[1].gsub(".mp3","")
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end