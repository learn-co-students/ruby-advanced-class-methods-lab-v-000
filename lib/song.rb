require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
def self.create
created = self.new
created.save
created
end

def self.new_by_name(the_name)
song = self.new
song.name = the_name
song
end

def self.create_by_name(the_name)
  createdname = self.new
  createdname.name = the_name
  createdname.save
  createdname
end

def self.find_by_name(the_name)
  @@all.detect do |file_name|
    file_name.name == the_name
  end
end

def self.find_or_create_by_name(the_name)
self.find_by_name(the_name) ||  self.create_by_name(the_name)

end

def self.alphabetical
  Song.all.sort_by {|s| s.name} #is it s.name?? s(name)?? s[:name]??
end

def self.new_from_filename(filename)
conversion = filename.chomp(".mp3").split(" - ")

  song = self.new
  song.name = conversion[1]
  song.artist_name = conversion[0]
  song

end

def self.create_from_filename(filename)
  conversion = filename.chomp(".mp3").split(" - ")

    song = self.new_from_filename(filename)
    song.save
    song

end

def self.destroy_all
  @@all.clear
end

end
