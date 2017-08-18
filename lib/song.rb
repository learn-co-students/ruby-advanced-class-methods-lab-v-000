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
    return song
  end


  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) unless self.find_by_name(name)
    return self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    artist_name = song[0]
    name = song[1].gsub(".mp3","")
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end



  def self.create_from_filename(filename)
    song = filename.split(" - ")
    artist_name = song[0]
    name = song[1].gsub(".mp3","")
    new_song = self.create
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
puts song.name
puts song.artist_name
