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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    songs = self.all.collect{|s| s.name}
    songs.sort!
    songs.collect{|s| Song.find_by_name(s)}
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    file_arr = filename.split(" - ")
    song = self.new_by_name(file_arr[1])
    song.artist_name = file_arr[0]
    song
  end

  def self.create_from_filename(filename)
    filename.chomp!(".mp3")
    file_arr = filename.split(" - ")
    song = self.create_by_name(file_arr[1])
    song.artist_name = file_arr[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
