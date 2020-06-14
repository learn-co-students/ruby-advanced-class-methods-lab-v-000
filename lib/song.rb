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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
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

  def self.new_from_filename(mp3)
    ## parsing argument data
    mp3.chomp!(".mp3")
    song_data = mp3.split(" - ")
    artist_name = song_data[0]
    name = song_data[1]

    ## new instance of song
    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(mp3)
    ## parsing argument data
    mp3.chomp!(".mp3")
    song_data = mp3.split(" - ")
    artist_name = song_data[0]
    name = song_data[1]

    ## new instance of song
    song = self.new
    song.artist_name = artist_name
    song.name = name
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
