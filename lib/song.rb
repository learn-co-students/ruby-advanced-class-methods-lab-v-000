class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = @@all.detect{|song| song.name == name}
    (song == nil) ? new_song = self.create_by_name(name) : song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song_detail_array = filename.split(/-|\./)
    song.name = song_detail_array[1].sub(/mp3/,'').lstrip
    song.artist_name = song_detail_array[0].rstrip
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song_detail_array = filename.split(/-|\./)
    song.name = song_detail_array[1].sub(/mp3/,'').lstrip
    song.artist_name = song_detail_array[0].rstrip
    song.save
    song
  end

end
