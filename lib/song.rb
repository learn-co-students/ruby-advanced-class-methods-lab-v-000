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
    song = self.new_by_name(name)
    song.save

    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
  end

  def self.new_from_filename(filename)
    name_and_artist = filename.split(/\s-\s|\.mp3/)
    song = self.new_by_name(name_and_artist[1])
    song.artist_name = name_and_artist[0]

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save

    song
  end

  def self.destroy_all
    self.all.clear
  end
end
