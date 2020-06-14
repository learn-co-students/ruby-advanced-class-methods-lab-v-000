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
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      new_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist_split = filename.split("-")
    artist = artist_split[0].strip
    title = artist_split[1].split(".")[0].strip

    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    artist_split = filename.split("-")
    artist = artist_split[0].strip
    title = artist_split[1].split(".")[0].strip

    song = self.new
    song.artist_name = artist
    song.name = title
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
