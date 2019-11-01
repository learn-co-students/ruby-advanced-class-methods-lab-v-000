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

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name) == nil
      Song.create_by_name(song_name)
    elsif Song.find_by_name(song_name) != nil
      Song.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    song_name = data[1].split(".").first

    song = Song.create_by_name(song_name)
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file_name)
    data = file_name.split(" - ")
    song_name = data[1].split(".").first

    song = Song.create_by_name(song_name)
    song.artist_name = data[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
