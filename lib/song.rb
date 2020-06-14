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
    song=self.new
    song.save
    song
  end

  def self.new_by_name(song)
    new_song=self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song=self.new
    new_song.name = song
    self.all << new_song
    new_song
  end

  def self.find_by_name(song)
    self.all.detect {|song_name| song_name.name == song}
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)
    array=song.split(" - ")
    artist = array[0]
    array[1].slice!(".mp3")
    song_name=array[1]

    new_song=self.new
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(song)
    new_song = self.new_from_filename(song)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end 
end
