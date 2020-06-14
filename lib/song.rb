# methods could be changed to call self.all method instead of calling @@all

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
    #@@all << song
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
    #Better Solution!
    #self.all << self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    @@all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
    #return self.find_by_name(song_name) if true
    #self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song
    #Better solution!
    # self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
