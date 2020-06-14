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
    #@@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    #song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song_detector = @@all.detect{|song| song.name == song_name}
    if song_detector == nil
      self.create_by_name(song_name)
    else
      song_detector
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_artist = filename.split(" - ")[0]
    file_song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = file_song_name
    song.artist_name = file_artist
    song
  end

  def self.create_from_filename(filename)
    file_artist = filename.split(" - ")[0]
    file_song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = file_song_name
    song.artist_name = file_artist
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
