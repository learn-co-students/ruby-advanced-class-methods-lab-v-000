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
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song|song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end

  def self.new_from_filename(filename)
    parsed_info = filename.split(" - ")
    parsed_song_name = parsed_info[1][0...-4]
    parsed_artist_name = parsed_info[0]

    new_song = self.new
    new_song.name = parsed_song_name
    new_song.artist_name = parsed_artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
