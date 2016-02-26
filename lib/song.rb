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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    file_artist = file.split(" - ")[0]
    file_song_name = file.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = file_song_name
    song.artist_name = file_artist
    song
  end

  def self.create_from_filename(song_name)
    if song_name.include?(".mp3")
      song = self.new
      artist_and_song_array = song_name.split(" - ")
      song.name = artist_and_song_array[1].chomp(".mp3")
      song.artist_name = artist_and_song_array[0]
      self.all << song
      song
    end
  end

  def self.destroy_all
    self.all.clear
  end
end