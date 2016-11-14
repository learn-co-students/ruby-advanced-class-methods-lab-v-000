class Song
  attr_accessor :name, :artist_name
  @@all = []
  @name
  def self.all
    @@all
  end

  def self.create
    song = self.new
  @@all << song
    song
  end

  def self.new_by_name(nam)
    song = self.new
    song.name = nam
    song
  end

  def self.create_by_name(nam)
    song = Song.new
    song.name = nam
  @@all <<  song
  song
  end

  def self.find_by_name(nam)
@@all.each{|song|
    if song.name == nam
  return song
  end
  }
  end

  def self.find_or_create_by_name(song_name)
  @@all.detect{|song|
 return song.name == song_name
    } # end of detect
    song = Song.new
    song.name = song_name
    return song
      end

  def save
    self.create.all << self
  end

def self.alphabetical
 @@all.sort_by{|song|
  song.name
  }
end
def self.new_from_filename(str)
  song = Song.new
  str_array = str.split("-")
    song.name = str_array[1].split(".")[0]
    song.name.strip! # will strip white spaces from the song
  song.artist_name = str_array[0].strip

  song
end
end
