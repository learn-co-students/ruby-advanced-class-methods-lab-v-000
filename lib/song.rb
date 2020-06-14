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

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|title| title.name}
  end

  def self.new_from_filename(mp3)
    song = self.new
    mp3 = mp3.split(" - ")
    artist_name = mp3[0]
    name = mp3[1].chomp(".mp3")
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(mp3)
    song = self.create
    mp3 = mp3.split(" - ")
    artist_name = mp3[0]
    name = mp3[1].chomp(".mp3")
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.destroy_all
    self.all.clear
end

end
