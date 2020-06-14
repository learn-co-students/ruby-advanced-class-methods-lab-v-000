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
    return song
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

  def self.find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    song = filename.split(' - ')
    artist_name = song.first
    name = song.last.gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = filename.split(' - ')
    artist_name = song.first
    name = song.last.gsub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
