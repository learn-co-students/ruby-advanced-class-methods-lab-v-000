# require "pry"
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
    create = self.new
    create.save
    create
  end

def self.new_by_name(name)
  new_by_name = self.new
  new_by_name.name = name
  new_by_name
end

def self.create_by_name(name)
  create_by_name = self.new
  create_by_name.name = name
  create_by_name.save
  create_by_name
end

def self.find_by_name(name)
  @@all.find {|song| song.name == name}
end

def self.find_or_create_by_name(find_song)
  find_by_name = @@all.find {|song| song.name == find_song}
  if find_by_name == nil
    self.find_by_name(name)
    self.create_by_name(name)
    song = self.new
    song.name = find_song
    song.save
    song
  else
    find_by_name
  end
end

def self.alphabetical
  @@all.sort_by {|song| song.name}
# binding.pry
end

def self.new_from_filename(format)
  new_format = self.new
  new_format.name = format.split(/[^a-zA-Z\s]|\s-\s/)[1]
  new_format.artist_name = format.split(/[^a-zA-Z\s]|\s-\s/)[0]
  new_format
end

def self.create_from_filename(format)
  new_format = self.new
  new_format.name = format.split(/[^a-zA-Z\s]|\s-\s/)[1]
  new_format.artist_name = format.split(/[^a-zA-Z\s]|\s-\s/)[0]
  new_format.save
  new_format
end

def self.destroy_all
  @@all.clear
  end
end
