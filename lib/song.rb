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
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|title| title.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.all.find_by_name(name)
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|x|x.name}
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_with_ext = filename.split(" - ")[1]
    name = song_with_ext.split(".")[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
     artist_name = filename.split(" - ")[0]
    song_with_ext = filename.split(" - ")[1]
    name = song_with_ext.split(".")[0]
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end


end

