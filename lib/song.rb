class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    @@all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)        #Song.new_from_filename("Taylor Swift - Blank Space.mp3")
    name_change = name.sub(/(.mp3)/, "").split(" - ")
    song = self.create_by_name(name_change[1])
    song.artist_name = name_change[0]
    song
  end

  def self.create_from_filename(name)
    name_change = name.sub(/(.mp3)/, "").split(" - ")
    song = self.create_by_name(name_change[1])
    song.artist_name = name_change[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
