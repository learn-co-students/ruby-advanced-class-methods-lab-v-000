class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song_name = self.new
    @@all << song_name
    song_name
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|name| name.name}
  end

  def self.new_from_filename(file)
    album = file.split(" - ")
    artist_name = album[0]
    album[1] = album[1].gsub(/.mp3/, "")
    name = album[1]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    album = file.split(" - ")
    artist_name = album[0]
    album[1] = album[1].gsub(/.mp3/, "")
    name = album[1]

    song = self.new
    @@all << song
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
