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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(new_name)
    new_song = Song.new
    new_song.name = new_name
    new_song
  end

  def self.create_by_name(new_name)
    new_song = Song.new
    new_song.name = new_name
    new_song.save
    new_song
  end

  def self.find_by_name(find_name)
    Song.all.detect do |song|
      song.name == find_name
    end
  end

  def self.find_or_create_by_name(fc_name)
    if Song.find_by_name(fc_name)!= nil
      Song.find_by_name(fc_name)
    else
      Song.create_by_name(fc_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|songID|songID.name}
  end

  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    song_array[1].slice!".mp3"
    new_song = Song.new_by_name(song_array[1])
    new_song.artist_name = song_array[0]
    new_song
  end

  def self.create_from_filename(file_name)
    song_array = file_name.split(" - ")
    song_array[1].slice!".mp3"
    new_song = Song.create_by_name(song_array[1])
    new_song.artist_name = song_array[0]
    new_song
  end

  def self.destroy_all
    Song.all.clear
  end
end
