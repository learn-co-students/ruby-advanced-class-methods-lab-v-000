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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)#################
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical  #find song by name. #return as an array , sort array, relturn
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(artist_name_and_song)
    #artist_name_and_song.slice!(-4..-1) #remove ".mp3"
    artist_name_and_song = artist_name_and_song.split(" - ") #array with artist_name and name as elements
    artist = artist_name_and_song[0] # artist name
    name = artist_name_and_song[1].gsub(".mp3","") # name

    song = self.new
    song.name = name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(artist_name_and_song)
    #artist_name_and_song.slice!(-4..-1) #remove ".mp3"
    artist_name_and_song = artist_name_and_song.split(" - ") #array with artist_name and name as elements
    artist = artist_name_and_song[0] # artist name
    name = artist_name_and_song[1].gsub(".mp3","") # name

    song = self.create
    song.artist_name = artist
    song.name = name
    song

  end

  def self.destroy_all
    self.all.clear
  end

end
