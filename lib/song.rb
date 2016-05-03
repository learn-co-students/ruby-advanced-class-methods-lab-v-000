class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.new
    Song.all << song unless Song.all.detect {|song| song.name == song}
    return song
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    terms = filename.split(" - ")
    song = Song.new
    song.artist_name = terms[0]
    song.name = terms[1][0..-5]
    return song
  end

  def self.create_from_filename(filename)
    terms = filename.split(" - ")
    song = Song.new
    song.artist_name = terms[0]
    song.name = terms[1][0..-5]
    Song.all << song
    return song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
