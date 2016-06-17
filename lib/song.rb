class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.save
    self.class.all << self
  end

  def Song.create
    song = self.new
    Song.all << song
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    Song.all << song
    song.name = name
    song
  end

  def Song.find_by_name(name)
    self.all.detect {|n| n.name.downcase == name.downcase}
  end

  def Song.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end

  def Song.alphabetical
    self.all.sort {|x,y| x.name.downcase <=> y.name.downcase }
  end

  def Song.new_from_filename(filename)
    song = self.new
    names_parse = filename.split(".")
    names_split = names_parse[0].split(" - ")
    artist_name_parse = names_split[0]
    song_name_parse = names_split[1]
    song.artist_name = artist_name_parse
    song.name = song_name_parse
    song
  end

  def Song.create_from_filename(filename)
    Song.all << Song.new_from_filename(filename)
  end

  def Song.destroy_all
    @@all.clear
  end
end
