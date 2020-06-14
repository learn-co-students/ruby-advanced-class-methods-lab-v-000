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
    song = Song.new
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
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      name

    else
      song = self.new
      song.save
      song.name = name
      song
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(name)
    data = name.split(" - ")
    artist_name = data[0]
    name = data[1].chomp ".mp3"
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    data = name.split(" - ")
    artist_name = data[0]
    name = data[1].chomp ".mp3"
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
