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
  
  #Class method here.  Instead of initialize, we are adding this to our class
  #functionality.
  #To Define this method we enact the following
  # the local var song is = Song.new, which is creating a new song
  # the song is then saved by song.save?? and then returns the song
  def self.create
    song = Song.new
    song.save
    song
end

def self.new_by_name(name)
  @name = Song.new 
  @name.save 
  @name
end
end
