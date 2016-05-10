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
    Song.all.detect{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
   Song.find_by_name(name) || Song.create_by_name(name)
  end

  def Song.alphabetical
    @@all.sort_by! {|i| i.name}
  end

  def Song.new_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    name = data[1]
    artist_name = data[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    data = filename.chomp(".mp3").split(" - ")
    name = data[1]
    artist_name = data[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    Song.all << song 
  end

  def Song.destroy_all
    self.all.clear
  end
end





