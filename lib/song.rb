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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    #song_artist, song_name = filename.match(/(.*) - (.*)\./i).captures
    /(.*) - (.*)\./i =~ filename
    song_artist, song_name = $1, $2
    song = self.new_by_name(song_name)
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  # burn, baby burnnnnnnn!!! lol
  def self.destroy_all
    self.all.clear
  end

end
