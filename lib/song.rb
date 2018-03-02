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
    song.save.first
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
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
    if self.find_by_name(song_name) != nil
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    artist_name, song = file[0...-4].split(" - ")
    new_song = self.new_by_name(song)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file)
    artist_name, song = file[0...-4].split(" - ")
    new_song = self.create_by_name(song)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
