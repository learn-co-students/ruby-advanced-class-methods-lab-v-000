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
  self.all << song
  song
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name }
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else self.find_by_name(name)
  end
end

def self.alphabetical
  self.all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
  file_name = filename.split(/\s\-\s|\./)
   song = self.new
   song.artist_name = file_name[0]
   song.name = file_name[1]
   song
end

def self.create_from_filename(filename)
file_name = filename.split(/\s\-\s|\./)
 song = self.new
 song.artist_name = file_name[0]
 song.name = file_name[1]
 song.save
 song
end

def self.destroy_all
  self.all.clear
end

end
