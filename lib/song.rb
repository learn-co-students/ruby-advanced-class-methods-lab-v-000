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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      song = self.create_by_name(title)
      song
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[0]
    song_name = data[1].chomp(".mp3")
    song = self.create_by_name(song_name)
    song.artist_name = name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
