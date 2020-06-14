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
    new_song = Song.new
    new_song.save
    return new_song
  end
    
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    return new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    return new_song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(mp3)
    filename = mp3.chomp(".mp3")
    song_file = filename.split(" - ")
    new_song = Song.new
    new_song.name = song_file[1]
    new_song.artist_name = song_file[0]
    return new_song
  end
  
  def self.create_from_filename(mp3)
    new_song = Song.new_from_filename(mp3)
    new_song.save
  end
  
  def self.destroy_all
    @@all.clear
  end

end
