class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
      song = self.new
      song.save
      song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.create
    song.name = name_of_song
    song
  end

  def self.find_by_name(name_of_song)
    self.all.detect {|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
   self.find_by_name(name_of_song) || self.create_by_name(name_of_song)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    name_of_song = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = name_of_song
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    name_of_song = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = name_of_song
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
