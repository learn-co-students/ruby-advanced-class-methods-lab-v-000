class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new #create a new song and add to the array
    song.save
    song #return the new song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    # song = self.create  #instantiates/creates the song
    # song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_parts = filename.split(" - ")
    artist_name = song_parts[0]
    name = song_parts[1].gsub(".mp3", "")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_parts = filename.split(" - ")
    artist_name = song_parts[0]
    name = song_parts[1].gsub(".mp3", "")
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
