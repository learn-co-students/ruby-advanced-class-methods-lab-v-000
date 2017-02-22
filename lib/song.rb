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
    a_song = self.new
    @@all << a_song
    a_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    created_song = self.new
    created_song.name = name
    @@all << created_song
    created_song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) if !self.find_by_name(name)
    else return self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[1].slice!(".mp3")
    artist = song_info[0]
    title = song_info[1]

    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
