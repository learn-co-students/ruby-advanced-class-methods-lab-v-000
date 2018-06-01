require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

#def initialize
#end

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
  self.all.detect{|song| song.name == name}
end

def self.find_or_create_by_name(name)
#song = self.new
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create_by_name(name)
      end
    end

def self.alphabetical
  self.all.sort_by{|song| song.name}
end

#"Taylor Swift - Blank Space.mp3"
def self.new_from_filename(file_name)
  normalized_name = []
  normalized_name = file_name.split(' - ')
  name = normalized_name[1].gsub('.mp3', '')
  artist_name = normalized_name[0]
  song = self.new
  song.name = name
  song.artist_name = artist_name
  song

end

def self.create_from_filename(file_name)
song = self.new_from_filename(file_name)
song.save
song
end








def self.destroy_all
  self.all.clear
end

end
