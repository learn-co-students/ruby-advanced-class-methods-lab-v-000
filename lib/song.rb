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
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
         song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
      self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = file [0]
    mp3 = file[1].split(".")
    name =  mp3[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    artist = file [0]
    mp3 = file[1].split(".")
    name =  mp3[0]
    song = self.create
    song.name = name
    song.artist_name = artist
    song
  end

def self.destroy_all
  self.all.clear
end

end
