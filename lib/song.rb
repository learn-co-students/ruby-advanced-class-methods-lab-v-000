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

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(saves_song)
    song = self.new
    song.name = saves_song
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song_name|song_name.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|alpha|alpha.name}
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.artist_name = file[0]
    song.name = file[1]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
