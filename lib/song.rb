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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.detect {|song| song.name == name}
      self.all.detect {|song| song.name == name}
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |song1, song2|
      song1.name <=> song2.name
    end
  end

  def self.new_from_filename(song_data)
    song_formatted = song_data.split(" - ")
    artist = song_formatted[0]
    song_name = song_formatted[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(data)
    song = self.new_from_filename(data)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
