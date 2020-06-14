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
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      self.create_by_name(song_name)
    else
      song
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end
  
  def self.new_from_filename(file)
    song = self.new
    songs = file.split(/[\.\-]/)
    song.artist_name = songs[0].strip
    song.name = songs[1].strip
    return song
  end
  
  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
