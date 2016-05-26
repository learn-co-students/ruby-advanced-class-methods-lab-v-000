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
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if 
      @@all.include? song_name
      @@all.detect{|s| s.name == song_name}
    else
      song = self.create
      song.name = song_name
      song
    end
  end

  def self.alphabetical
    self.all.sort_by { |word| word.name }
  end

  def self.new_from_filename(file_name)
    split_for_dot = file_name.split(".")
    bit_we_want = split_for_dot[0]
    split_artist_and_song = bit_we_want.split(" - ")
    artist = split_artist_and_song[0]
    song_name = split_artist_and_song[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(file_name)
    split_for_dot = file_name.split(".")
    bit_we_want = split_for_dot[0]
    split_artist_and_song = bit_we_want.split(" - ")
    artist = split_artist_and_song[0]
    song_name = split_artist_and_song[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end








