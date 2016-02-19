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
    song=self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song=self.new
    song.name=name
    song
  end

def self.create_by_name(name)
  song=self.new_by_name(name)
  song.save
  song
end

def self.find_by_name(name)
  self.all.detect{|person| person.name == name}
end

def self.find_or_create_by_name(name)
  self.all.include?(name)? self.find_by_name(name) : self.create_by_name(name)

end

def self.alphabetical
  self.all.sort{|a,b| a.name <=> b.name}
end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    name = data[1][0..data[1].length-5] ##range used to slice off file extension
    artist = data[0]
    song = self.new
    song.artist_name = artist
    song.name=name
    song
  end

  def self.create_from_filename(name)
    song=self.new_from_filename(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
