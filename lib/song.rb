require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #reader class method for @@all
    @@all
  end

  def save
    #@@all << self == Same as below?
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #whats my scope? => Class
    #2) assign song name to name
    #3) return new instance
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    #1) add new song to @@all
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    #returns matching instance of song_name
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    #returns matching song instance OR creates new instance and returns it
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|n| n.name}
  end

  def self.new_from_filename(file)
    # Taylor Swift - Blank Space.mp3 => takes this and split at '-' and remove '.mp3' (use .chomp('.mp3'))
    clean_file = file.split('-')
    artist = clean_file[0].strip
    song = clean_file[1].chomp('.mp3').strip
    new_song = self.new_by_name(song)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
