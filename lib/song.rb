class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save # a method that only operates on instances of Song; not on the Song class itself
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new         #creates the new song.
    song.name = song_name   #gives it a name
    song                    #instance of Song
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save
    song                    #instance of Song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    artist_name = filename.split(" -").first
    name = filename.split(".").first.split("- ").last  #perfrom multiple splits in one line
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    #"Taylor Swift - Blank Space.mp3"
    song = Song.new
    artist_name = filename.split(" -").first
    name = filename.split(".").first.split("- ").last
    song.save
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
