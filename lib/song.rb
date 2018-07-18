class Song
  attr_accessor :name, :artist_name, :new_by_name
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
def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name(name)
      song = Song.create
      song.name = name
      song.save
      song
    end


def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      @@all.find { |song| song.name == name }

  else
    self.create_by_name(name)
  end
  end
  def self.alphabetical
    @@all.uniq.sort_by{ |song| song.name}
end
def self.new_from_filename(file)
  song = Song.new
  song_array = file.split(" - ")
  song_name = song_array[1].chomp(".mp3")
  song.name = song_name
  song.artist_name = song_array[0]
  song
end
def self.create_from_filename(file)
  song = self.new_from_filename(file)
  song.save
end
def self.destroy_all
   @@all.clear
end

end
