class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
  song = self.create
  song.name = name
  song
end

def self.find_by_name(name)
  @@all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
    song.nil? ? self.create_by_name(name) : song
end

def self.alphabetical
  @@all.sort_by {|x| x.name}
end

def self.new_from_filename(filename)
  filename = filename.split(/[-.]/)
  artist_name = filename[0].strip
  name = filename[1].strip
  song = self.new
  song.name = name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  filename = filename.split(/[-.]/)
  artist_name = filename[0].strip
  name = filename[1].strip
  song = self.create
  song.name = name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end

  def save
    self.class.all << self
  end

end
