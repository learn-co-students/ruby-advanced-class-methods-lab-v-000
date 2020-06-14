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

  def self.new_by_name(song_title)
    new_song = self.new
    new_song.name = song_title
    new_song
  end

  def self.create_by_name(song_title)
    new_song = self.create
    new_song.name = song_title
    new_song
  end

  def self.find_by_name(song_title)
    self.all.detect{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_name_1 = file_name.split(" - ")
    artist_name = split_name_1[0]
    song_title = split_name_1[1].split(".").first

    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file_name)
    split_name_1 = file_name.split(" - ")
    artist_name = split_name_1[0]
    song_title = split_name_1[1].split(".").first

    new_song = self.create
    new_song.name = song_title
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end