require 'pry'

#Question - is the use of the local variable "song" bad practice?

# first attempt 6/21/17
# class Song
#   attr_accessor :name, :artist_name
#   @@all = []
#
#   def self.all
#     @@all
#   end
#
#   def save
#     self.class.all << self
#   end
#
#   def self.create
#     song = self.new
#     song.save
#     song
#   end
#
#   def self.new_by_name(name)
#     song = self.new
#     song.name = name #bc you're not initializing things use the local var?
#     song #need to return the instance at the end
#   end
#
#   def self.create_by_name(name)
#     song = self.new_by_name(name)
#     song.save
#     song
#   end
#
#   def self.find_by_name(name)
#     self.all.detect{|s| s.name == name}
#   end
#
#   def self.find_or_create_by_name(name)
#     if !self.find_by_name(name)
#       song = self.create_by_name(name)
#     else
#       self.find_by_name(name)
#     end
#   end
#
#   def self.alphabetical
#     self.all.sort {|a,b| a.name <=> b.name}
#   end
#
#   def self.new_from_filename(filename)
#     #extract the data from the filename
#     filename = filename.split(/(\s-\s)|(.mp3)/)
#     #artist = filename[0]
#     #song_name = filename[2]
#
#     #initialize a new aspect
#     song = self.new
#     song.name = filename[2]
#     song.artist_name = filename[0]
#     song
#   end
#
#   def self.create_from_filename(filename)
#     #call #new_from_filename
#     #call #save
#     song = self.new_from_filename(filename)
#     song.save
#     song
#   end
#
#   def self.destroy_all
#     self.all.clear
#   end
#
# end

# second attempt 7/3/17

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
    Song.new.tap {|new_song| new_song.save}
  end

  def self.new_by_name(name)
    Song.new.tap {|new_song| new_song.name = name}
  end

  def self.create_by_name(name)
    self.new_by_name(name).tap {|new_song| new_song.save}
    # self.create(name).tap {|new_song| new_song.name = name}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(/(\s-\s)|(.mp3)/)
    artist, song_name = filename[0], filename[2]
    self.new_by_name(song_name).tap do |new_song|
      new_song.artist_name = artist
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap do |new_song|
      new_song.save
    end
  end

  def self.destroy_all
    self.all.clear
  end
end
