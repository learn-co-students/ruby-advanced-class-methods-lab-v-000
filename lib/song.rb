require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

#   def initialize
#      @name = name
#      @artist_name = artist_name
#      @@all << self
#     name = self.new_by_name
#   end

  def self.create
  #  initialize
    song = self.new
    self.all << song
    #@@all << song
    return song

  end


  def self.new_by_name(name)
    song = self.new
    song.name = name   #huh?
    return song
#     name = Song.new
#     @name = name
#     return name
  end

def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
  #  @@all << song
    return song
#     name = Song.new
#     @name = name
#     return name
  end

#   def self.find_by_name(name)
#     self.all.detect{|song| song.name == name}
#     return song
#   end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
#    self.all.detect{|song| song.name == song } #NOT 'song'
    #return song
  end

  def self.find_or_create_by_name(name)
   # self.find_by_name(name) || self.create_by_name(name)
    self.create_by_name(name) || self.find(name)
#        self.all.each do |song|
#          if self.include?(song)
#            return song
#          else
#            song = self.new
#            song.name = name
#            self.all << song
#          end
#        end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
      song = self.new
      song_file = []
      song_file = filename.split(/[-\.]/).map(&:strip)
      song.artist_name = song_file[0]
      song.name = song_file[1]
      return song
  end

  def self.create_from_filename(filename)
      song = self.create
      song_file = []
      song_file = filename.split(/[-\.]/).map(&:strip)
      song.artist_name = song_file[0]
      song.name = song_file[1]
      self.all << song
      return song
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
