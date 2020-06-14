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
  return song
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song.save
  return song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  song.save
  return song
end

def self.find_by_name(name)
  self.all.each do |object|
    if object.name == name
      return object
    end
end
return nil
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else
    self.find_by_name(name)
  end
end

def self.alphabetical
  return self.all.sort_by{|object| object.name}
end

def self.new_from_filename(filename)
  array_of_inputs = filename.chomp(".mp3").split(" - ")
  song = self.new
  song.name = array_of_inputs[1]
  song.artist_name = array_of_inputs[0]
  return song
end

def self.create_from_filename(filename)
self.new_from_filename(filename).save
end

def self.destroy_all
  self.all.clear
end

end
