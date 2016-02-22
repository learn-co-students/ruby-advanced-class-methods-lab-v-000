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
      self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1].chomp(".mp3")
    song
  end

  def self.destroy_all
    @@all.clear
  end

end