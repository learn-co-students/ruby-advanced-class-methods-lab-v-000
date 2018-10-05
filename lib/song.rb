class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_string)
    song = self.new
    song.name = song_string
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end


  # def self.find_or_create_by_name("name")
  #   self.all.find{|person| person.name == name}
  # end
  
  # Build a class constructor Song.new_by_name that takes in the string name of a song and returns a song instance with that name set as its name property. Song.new_by_name should return an instance of Song and not a simple string or anything else. 
  