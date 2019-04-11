class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #class constructor
    song = self.new #initializes song
    @@all << song #saves song to the @@all class variable
    song #returns song instance that was initialized and saved
  end

  def self.new_by_name(song_name) #class constructor that takes in the string name of a song
    song = self.new #returns a song instance with that name set as its name property
    song.name = song_name
    song #returns an instance of Song
  end

  def self.create_by_name(song_name) #class constructor that takes in the string of a song
    song = self.create
    song.name = song_name
    song #returns a song instance with that name set as its name property and the song being saved into the @@all class variable
  end

  def self.find_by_name(song_name) #name finder that accepts the string name of a song
    self.all.find {|song| song.name == song_name} #returns the matching instance of the song witht hat name
  end

  def self.find_or_create_by_name(song_name) #FIND/CREATE method
    if self.find_by_name(song_name) #if song is found,
      return self.find_by_name(song_name) #song is returned with matching title.
    else self.create_by_name(song_name) #if song is not found, it is created and returned.
      end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name} #http://ruby-doc.org/core-2.6.2/Enumerable.html#method-i-sort_by
  end

  def self.new_from_filename(filename) #class constructor that accepts an .mp3 file
    song_list = filename.split(" - ")
    song_list[1] = song_list[1].chomp(".mp3")
    song = self.new
    song.name = song_list[1]
    song.artist_name = song_list[0]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
