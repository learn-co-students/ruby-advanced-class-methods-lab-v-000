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
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def Song.create_by_name(title)
    song = Song.new
    song.name = title
    @@all << song
    song
  end

  def Song.find_by_name(title)
    @@all.detect {|song| song.name == title }
  end

  def Song.find_or_create_by_name(title)
    Song.find_by_name(title) || Song.create_by_name(title)
  end

  def Song.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def Song.new_from_filename(format)
    temp = format.split(/[-,.]/)

    song = Song.new
    temp[1].slice!(0)
    song.name = temp[1]
    song.artist_name = temp[0].chop
    song
  end

  def Song.create_from_filename(format)
    @@all << Song.new_from_filename(format)
  end

  def Song.destroy_all
    @@all.clear
  end
end
