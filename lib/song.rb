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
    @@all << self.new
    self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(song)
    Song.all.detect {|song| song == song}
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) ? self.find_by_name(song) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(new_song)
    song = Song.new
    song.name = new_song.scan(/\w+[^-]+\w+[^.]\w+[^.]/)[1]
    song.artist_name = new_song.scan(/\w+[^-]+\w+[^.]\w+[^.]/)[0].strip
    song
  end

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
  end
end
