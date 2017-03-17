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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) || self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name.downcase }
  end

  def self.new_from_filename(song)
    array = song.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(song)
    array = song.split(" - ")
    artist_name = array[0]
    song_name = array[1].gsub(".mp3", "")
    new_song = self.create
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end


  def self.destroy_all
    self.all.clear
  end

end
