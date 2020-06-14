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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(song)
    self.all.detect {|name| name.name == song }
  end

  def self.find_or_create_by_name(song)
    !find_by_name(song) ? create_by_name(song) : find_by_name(song)
  end

  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}

  end

  def self.new_from_filename(song_name)
    break_down = song_name.split (" - ")
    song = self.new
    song.artist_name = break_down[0]
    song.name = break_down[1].gsub(".mp3", "")
    song

  end

  def self.create_from_filename(song_name)
    break_down = song_name.split(" - ")
    song = self.create
    song.name = break_down[1].gsub(".mp3", "")
    song.artist_name = break_down[0]

    song
  end

  def self.destroy_all
    self.all.clear
  end 

end
