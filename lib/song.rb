class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #added stuff
  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(what)
    song = self.new
    song.name = what
    song
  end

  def self.create_by_name(what)
    song = self.new
    song.name = what
    @@all << song
    song
  end

  def self.find_by_name(song)
    self.all.select {|value| value.name == song}[0]
  end

  def self.find_or_create_by_name(song)
    #binding.pry
    self.create_by_name(song) #if !self.find_by_name(song)
  end

  def self.alphabetical
    #binding.pry
    ordered = @@all.map {|entry| entry.name}.sort
    ordered.map {|x| find_by_name(x)}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song_name = filename[1].split(".")[0]
    artist_name = filename[0]

    song = self.new
    #binding.pry
    song.name = song_name
    song.artist_name = artist_name
    song
    #binding.pry
  end

    def self.create_from_filename(filename)
      @@all << self.new_from_filename(filename)
    end
  
    def self.destroy_all
      @@all=[]
    end

end