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
    @@all <<  song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all <<  song
    return song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by!{ |m| m.name.downcase }
  end

  def self.new_from_filename(filename)
    data = filename.chomp('.mp3')
      initials = data.split(" - ")
      artist = initials[0]
      name = initials[1]
      song = self.new # This is an important line.
      song.name = name
      song.artist_name = artist
      return song
end

def self.create_from_filename(filename)
  data = filename.chomp('.mp3')
    initials = data.split(" - ")
    artist = initials[0]
    name = initials[1]
    song = self.new
    song.name = name
    song.artist_name = artist
    @@all << song
end

  def self.destroy_all
    @@all.clear
  end

end
