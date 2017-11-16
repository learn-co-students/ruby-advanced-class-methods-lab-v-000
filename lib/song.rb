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
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(mp3_file)
    info = mp3_file.split(" - ")
    artist = info[0]
    song_file = info[1].split(".")
    song = song_file[0]

    new_file = self.new
    new_file.artist_name = artist
    new_file.name = song
    new_file
  end

  def self.create_from_filename(mp3_file)
    song = self.new_from_filename(mp3_file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
