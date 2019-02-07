class Song 
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
 
  def save
    @@all << self
    #self.class.all
  end

  def self.create
    #instantiate a song
    #save the song
    #returns new song 
    song = self.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(song_name)
     song = self.create 
     song.name = song_name 
     song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical 
    @@all.sort_by {|song_name| song_name.name}
  end

  def self.new_from_filename(filename)
    #filename = "Taylor Swift - Blank Space.mp3"
    info = filename.split(" - ")
    #binding.pry

    song = self.new #created a new song object
    song.name = info[1].chomp(".mp3")
    song.artist_name = info[0]
    song
  end 

  def self.create_from_filename(filename)
    #filename = "Taylor Swift - Blank Space.mp3"
    info = filename.split(" - ")
    
    song = self.create #created a new song object
    song.name = info[1].chomp(".mp3")
    song.artist_name = info[0]
    song
  end

  def self.destroy_all
    @@all.clear

  end

end 
