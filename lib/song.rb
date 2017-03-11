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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist_name = split_file[0]
    song_title = split_file[1]


    song = self.new_by_name(song_title)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist_name = split_file[0]
    song_title = split_file[1]


    song = self.create_by_name(song_title)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
