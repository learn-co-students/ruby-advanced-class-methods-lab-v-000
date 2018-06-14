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
    self.all << song
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    return song
  end

  def self.find_by_name(song_name)
    self.all.find do |track|
      track.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return name
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    return self.all.sort_by do |song|
      song.name
    end
  end

 def self.new_from_filename(mp3)
   info = mp3.tr(".mp3").split("-")
     new_song = self.new
     new_song.name = info[0]
     new_song.artist_name = info[1]
 end

 def self.destroy_all
   self.all.clear
 end

end
