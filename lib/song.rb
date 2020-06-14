class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
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
    song.name = name
    Song.all << song
    song
  end

  def Song.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name) != nil
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def Song.new_from_filename(filename)
    song = self.new
    split_name = filename.split(" - ")
    song.artist_name = split_name[0]
    song.name = split_name[1].chomp(".mp3")
    song
  end

  def Song.create_from_filename(filename)
    Song.all << Song.new_from_filename(filename)
  end

  def Song.destroy_all
    @@all.clear
  end
end
