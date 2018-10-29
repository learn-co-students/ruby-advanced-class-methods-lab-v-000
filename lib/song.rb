require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

# binding.pry

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
 #   binding.pry
  end
  
  def self.new_by_name(name)
    song=Song.new
    song.name = name
    song
  end
 
  def self.create_by_name(name)
    @song=Song.new
    @song.name = name
    @song.save
    @song
  end
  # binding.pry
  
  def self.find_by_name(name)
    @@all.detect { |x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|x| x.name}
  end
   
  def self.new_from_filename(filename)
   #binding.pry
   @song = Song.new
    song_info=filename.split(' - ')
    @song.artist_name=song_info[0]
    @song.name=song_info[1].chomp(".mp3")
    @song
  end
  
  def self.create_from_filename(filename)
  #  binding.pry
    Song.new_from_filename(filename)
   # binding.pry
    Song.create_by_name(@song.name)
  #  binding.pry
    @song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
