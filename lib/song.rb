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
  
  def self.create
    song = Song.new 
    @@all << song unless @@all.include?song
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
    @@all << song unless @@all.include?song
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find do |song|
    song.name == song_name
      end
  end
  
  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file)
    song_data = file.split(/[-.]/)
    song = self.new
     @artist_name = song_data[0].strip
      @name = song_data[1].strip

      song.name = @name
      song.artist_name = @artist_name
      song
  
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
  
  
  
  def self.destroy_all
    @@all.clear
  end
  
end
