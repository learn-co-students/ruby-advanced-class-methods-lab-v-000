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
    self.all << song = Song.new
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    self.all << song = Song.new
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == true
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    rows = filename.split(" - ")
    rows.collect do |row|
      @song_name = rows[1]
      @artist = rows[0]
    end
    new_song = Song.new_by_name(@song_name)
    new_song.artist_name = @artist
    new_song
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    rows = filename.split(" - ")
    rows.collect do |row|
      @song_name = rows[1]
      @artist = rows[0]
    end
    new_song = Song.create_by_name(@song_name)
    new_song.artist_name = @artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
