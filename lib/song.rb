class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

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
    @@all.detect{|song| song.name == name}
  end

def self.find_or_create_by_name(name)
 self.find_by_name(name) || song = self.create_by_name(name)
end

def self.alphabetical
  @@all.sort_by { |song| song.name }
end

def self.new_from_filename(filename)
  split_string = filename.split(" - ")
  split_string[1].slice!(".mp3")
  song = self.new
  song.name = split_string[1]
  song.artist_name = split_string[0]
  song
end

def self.create_from_filename(filename)
  @@all << self.new_from_filename(filename)
end

def self.destroy_all
  @@all = []
end

  def save
    self.class.all << self
  end

end
