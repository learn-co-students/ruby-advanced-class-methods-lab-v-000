class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
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
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort{|a,b|
        a.name <=> b.name
      }
  end

  def self.new_from_filename(filename)
     components = filename.split(/\s?[\-,\.]\s?/)
     #components = filename.split(".")
     song = self.new
     song.name = components[1]
     song.artist_name = components[0]
     #Ssong.save
     song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
