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
    new_song = Song.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    self.all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    data = filename.split(" - ")
    new_song = self.create_by_name(data[1])
    new_song.artist_name = data[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
