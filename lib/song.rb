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

  def Song.new_by_name(new_song)
    song = Song.new
    song.name = new_song
    song
   end

  def Song.create_by_name(new_song)
    song = Song.create
    song.name = new_song
    song
    end

  def Song.find_by_name(new_song)
    Song.all.detect do |songs|
      songs.name == new_song
    end
  end

  def Song.find_or_create_by_name(new_song)
    Song.find_by_name(new_song) || Song.create_by_name(new_song)
  end

  def Song.alphabetical
    @@all.sort_by do |new_song|
      new_song.name
    end
  end

  def Song.new_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    new_song = part[1].gsub(".mp3", "")

    song = Song.new
    song.name = new_song
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    new_song = part[1].gsub(".mp3", "")

    song = Song.create
    song.name = new_song
    song.artist_name = artist_name
    song
  end

  def Song.destroy_all
    Song.all.clear
  end

end
