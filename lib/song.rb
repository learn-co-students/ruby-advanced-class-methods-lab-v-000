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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    Song.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|object| object.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    array = file_name.split(" - ")
    song.artist_name = array[0]
    song.name = array[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    array = file_name.split(" - ")
    song.artist_name = array[0]
    song.name = array[1].chomp(".mp3")
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
