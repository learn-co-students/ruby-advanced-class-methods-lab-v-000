class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def initiate(name)
    @name = name
    @name = song_name
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
    end
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end
  def self.find_by_name(song_name)

    @@all.detect do |song_label|
      if song_label.name == song_name
      song_label

end
end
end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name)
    self.find_by_name(song_name)
else
    self.create_by_name(song_name)
end
end
def self.alphabetical
  @@all.sort do |a,b| a.name <=> b.name
end
end
def self.new_from_filename(filename)
  info = filename.split(" - ")
  artist_name = info[0]
  song_name_info = info[1]
  info2 = song_name_info.split(".")
  song_name = info2[0]
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end
def self.create_from_filename(filename)
  info = filename.split(" - ")
  artist_name = info[0]
  song_name_info = info[1]
  info2 = song_name_info.split(".")
  song_name = info2[0]
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  @@all << song
end
def self.destroy_all
  self.all.clear
end
  def save
    self.class.all << self
  end
end
