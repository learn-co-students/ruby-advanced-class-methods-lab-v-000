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
    song = create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|title| title.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if !find_by_name(song_name)
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted = all.sort_by {|x| x.name}
    sorted
  end

  def self.new_from_filename(music_file)
    music_file = music_file.sub(/(....)\z/, '')
    data = music_file.split(" - ")
    artist_name = data[0]
    name = data[1]
    song = create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(music_file)
    music_file = music_file.sub(/(....)\z/, '')
    data = music_file.split(" - ")
    artist_name = data[0]
    name = data[1]
    song = create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def destroy_all
    self.all.clear
  end

end








