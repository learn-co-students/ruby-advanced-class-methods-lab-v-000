class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all  # class reader
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

  def init_song_name(song_name)
    @name = song_name
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.init_song_name(song_name)
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.create
    new_song.init_song_name(song_name)
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.all.include?(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def artist_name_from_filename(filename) # pulls artist name from filename of format "artist_name - song_name.filetype"
    @artist_name = filename.split(" - ")[0]
  end

  def song_name_from_filename(filename) # pulls song name from filename of format "artist_name - song_name.filetype"
    @name = filename.split(" - ")[1].split(".")[0]
  end

  def self.new_from_filename(mp3_file)
    new_song = Song.new
    new_song.artist_name_from_filename(mp3_file)
    new_song.song_name_from_filename(mp3_file)
    new_song
  end

  def self.create_from_filename(mp3_file)
    new_song = Song.create
    new_song.artist_name_from_filename(mp3_file)
    new_song.song_name_from_filename(mp3_file)
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
