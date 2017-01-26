

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name=(name)
    song
  end

  def self.find_by_name(name)
   self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    alphabetical = []
    self.all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    artist_name = new_song[0]
    name = new_song[1].chomp(".mp3")
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_song = filename.split(" - ")
    artist_name = new_song[0]
    name = new_song[1].chomp(".mp3")
    song = self.create_by_name(name)
    song.artist_name = artist_name
  end

  #new_song = filename.split(" - ")
  #artist_name = new_song[0]
  #name = new_song[1].chomp(".mp3")
  #song = self.create_by_name(name)
  #song.artist_name = artist_name



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

end
