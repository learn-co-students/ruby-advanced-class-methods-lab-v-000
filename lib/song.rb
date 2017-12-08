class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create         #creates an instance of itself - instance of class Song
    song = self.new       #initializes a song
    self.all << song      #calls class method to save it to class variable
    song                  #returns the song
  end

  def self.new_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.find_by_name(string)
    self.all.find {|song|song.name == string
    }
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) == nil ? self.create_by_name(string) : self.find_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info= filename.split(" - ")
      artist = info[0]
      song_name = info[1].split(".mp3").join

      song = self.new
      song.artist_name = artist
      song.name = song_name
      song
  end

  def self.create_from_filename(filename)
    info= filename.split(" - ")
      artist = info[0]
      song_name = info[1].split(".mp3").join

      song = self.create
      song.artist_name = artist
      song.name = song_name
      song

  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
