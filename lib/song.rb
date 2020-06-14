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
    return song
  end

  def self.new_by_name(song_string)
    song = self.new
    song.name = song_string
    return song
  end

  def self.create_by_name(song_string)
    song = self.create
    song.name = song_string
    return song
  end

  def self.find_by_name(song_string)
    @@all.detect{|song| song.name == song_string}
  end

  def self.find_or_create_by_name(song_string)
    if @@all.detect{|song| song.name == song_string}
      return song
    else
      self.create
    end
  end

  def self.alphabetical
    @@all.sort_by {|a,b| a.name}
  end

  def self.new_from_filename(mp3)
    data = mp3.split(" - ")
    name = data[1].split(".")[0]
    artist_name = data[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(mp3)
    data = mp3.split(" - ")
    name = data[1].split(".")[0]
    artist_name = data[0]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.destroy_all
    self.all.clear
  end
end
