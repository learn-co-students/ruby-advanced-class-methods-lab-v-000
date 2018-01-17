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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name) # shorter method availaible below instead of if-else statement.
    if self.find_by_name(name) # self.find_by_name(song_name) || self.create_by_name(song_name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    #First step is to pull apart the filename ex: Song.new_from_filename("Taylor Swift - Blank Space.mp3")
    parts = filename.split(" - ") # splits at ' - '
    artist_name = parts[0] # loads first part into artist_name
    song_name = parts[1].gsub(".mp3","") #loads second part into song_name and removes .mp3 from string.

    song = self.new_by_name(song_name)
    song.artist_name= artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    song = self.create_by_name(song_name)
    song.artist_name= artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
