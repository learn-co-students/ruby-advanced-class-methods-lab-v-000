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
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if !!self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      return self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name.capitalize}
  end

  def self.new_from_filename(filename)
    song = self.create
    song_array = filename.split(" - ")
    song.name = song_array[1].chomp(".mp3")
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end


end

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song.name #=> "Blank Space"
song.artist_name #=> "Taylor Swift"
