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
    if @@all.include?(name)
      @@all.detect {|song| song.name == name}
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    @@all.sort! {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    song = self.new
    name_mp3 = file_name.split("-")[1].strip
    name = name_mp3.split(".")[0]
    artist = file_name.split("-")[0].strip
    song.artist_name = artist
    song.name = name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    name_mp3 = file_name.split("-")[1].strip
    name = name_mp3.split(".")[0]
    artist = file_name.split("-")[0].strip
    song.artist_name = artist
    song.name = name
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
