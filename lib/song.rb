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
@@all.detect { |song| song.name == song_name }
end

def self.find_or_create_by_name(song_name)
if @@all.include? song_name
@@all.detect { |song| song.name == song_name }
else
create_by_name(song_name)
end
end

def self.alphabetical
@@all.sort_by { |song| song.name }
end

def self.new_from_filename(file_name)
info = file_name.split(".")
part_we_want = info[0]
data = part_we_want.split(" - ")
artist_name = data[0]
song_name = data[1]

song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(file_name)
  info = file_name.split(".")
  part_we_want = info[0]
  data = part_we_want.split(" - ")
  artist_name = data[0]
  song_name = data[1]

  song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
end

def self.destroy_all
  @@all.clear
end

end
