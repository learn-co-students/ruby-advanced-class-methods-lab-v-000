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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.detect {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == song_name
      return song_name
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    all.sort_by {|song|song.name}
  end

  def self.new_from_filename(filename)
    newfile = filename[0..-5].split(" - ")
    song = self.new
    song.name = newfile[1]
    song.artist_name = newfile[0]
    song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
