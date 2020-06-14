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
    # initialize a song
    song = self.new
    # save the song to the @@all class var
    @@all << song
    # return the song that was created
    song
  end

  def self.new_by_name(name)
    song = self.new
    # return a song instance with the name set as its name property
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    # return a song instance with that name set as its name property
    song.name = name
    # save song into the @@all class var
    @@all << song
    song
  end

  def self.find_by_name(name)
    # return the matching instance of the song with that name
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name) # to prevent duplicates
    # either return a matching song instance with that name or create a new song and return the song instance
    result = self.find_by_name(name)
    result ? result : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    # parse the relevant components
    data = file_name.split(" - ")
    artist_name = data[0]
    # return a copy of str with all occurrences of patterns substituted for the second argument
    name = data[1].gsub(".mp3", "")
    #return a new song instance with the song name set to song name and the artist name set to artist
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    # tap into a method chain to perform operations on intermediate results within the chain
    song.tap { |song| self.all << song }
  end

  def self.destroy_all
    @@all.clear
  end

end
