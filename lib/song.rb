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
    new = self.new
    new.save
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = self.new_by_name(name)
    new.save
    new
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.all.find{|song| song.name == name}
    song ? song : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a ,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    song_artist = filename.match(/\A(.+)\s-/)[1].to_s
    song_name = filename.match(/\s- (.+).mp3/)[1].to_s
    new_song = self.new_by_name(song_name)
    new_song.artist_name = song_artist
    new_song
  end

  def self.create_from_filename(filename)
    song_artist = filename.match(/\A(.+)\s-/)[1].to_s
    song_name = filename.match(/\s- (.+).mp3/)[1].to_s
    new_song = self.new_by_name(song_name)
    new_song.artist_name = song_artist
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear 
  end

end
