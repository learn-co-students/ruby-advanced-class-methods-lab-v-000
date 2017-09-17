class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initializes(name, artist_name)
  #   @name = name
  #   @artist_name = name
  #   self.class.all << self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    # song.name = name
    # song.artist = artist_name
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(mp3) ## <== Is this the dryest way to do this?
    row = mp3.split(" - ")
    artist_name = row[0]
    song_name_mp3 = row[1].split(".")
    song_name = song_name_mp3[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(mp3)
    self.new_from_filename(mp3).save
  end

  def self.destroy_all
    self.all.clear
  end

end
