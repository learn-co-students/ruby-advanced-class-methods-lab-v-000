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
    @song = Song.new
    @song.save
    @song
  end

  def self.new_by_name(name)
    @song = Song.new
    @song.name = name
    @song
  end

  def self.create_by_name(name)
    @song = Song.new
    @song.name = name
    @song.save
    @song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(filename)
    song_array = filename.split("-")
    @song = self.new_by_name(song_array[1].chomp(".mp3").strip)
    @song.artist_name = song_array[0].strip
    @song
  end

  def self.create_from_filename(filename)
    song_array = filename.split("-")
    self.create_by_name(song_array[1].chomp(".mp3").strip)
    @song.artist_name = song_array[0].strip
    @song
  end

  def self.destroy_all
    @@all.clear
  end

end
