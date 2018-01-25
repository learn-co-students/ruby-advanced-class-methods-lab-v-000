class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name = "", artist_name = "")
  #   @name = name
  #   @artist_name = artist_name
  # end

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
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    song = nil
    song = Song.all.detect {|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create_by_name(name)
    end
    song
  end

end
