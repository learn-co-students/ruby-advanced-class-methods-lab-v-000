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
    new_song = self.new
    new_song.save
    new_song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    self.all.detect{|person| person.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort {|x, y| x.name <=> y.name}
  end
  def self.new_from_filename(mp3)
    array = mp3.split(" - ")
    song = self.new
    song.artist_name = array[0]
    song_array = array[1].split(".")
    song.name = song_array[0]
    song
  end
  def self.create_from_filename(mp3)
    array = mp3.split(" - ")
    song = self.create
    song.artist_name = array[0]
    song_array = array[1].split(".")
    song.name = song_array[0]
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
