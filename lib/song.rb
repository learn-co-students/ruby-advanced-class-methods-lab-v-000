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
    song
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name_of_song)
    self.all.detect {|song_name| song_name.name == name_of_song}
  end

  def self.find_or_create_by_name(song_name)
     if !self.find_by_name(song_name)
       self.create_by_name(song_name)
     else
       self.find_by_name(song_name)
     end
     #self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_name.slice! ".mp3"
    song = self.new
    song_det = file_name.split(" - ")
    song_name = song_det[1]
    artist_name = song_det[0]
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    file_name.slice! ".mp3"
    song = self.new
    song_det = file_name.split(" - ")
    song_name = song_det[1]
    artist_name = song_det[0]
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
