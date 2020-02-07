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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by {|song| song.name[0]}
    sorted
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    song_data = filename.split(" - ")
    new_song.artist_name = song_data[0]
    new_song.name = song_data[1].chomp(".mp3")
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.create
    song_data = filename.split(" - ")
    new_song.artist_name = song_data[0]
    new_song.name = song_data[1].chomp(".mp3")
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
