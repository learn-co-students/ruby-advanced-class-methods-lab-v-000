require "pry"
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
    self.all << song
    if self.all.include?(song)
      song
    end
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

 # def self.create_by_name(name) 
 #   song = self.new_by_name(name)
 #   @@all << song
 # end

  def self.find_by_name(name)
    @@all.find {|song| 
      if song.name == name
        song
      end}
  end

  def self.find_or_create_by_name(name) 
      self.find_by_name(name) ||
      self.create_by_name(name)
  end

 def self.alphabetical
  @@all.sort_by do |song| puts song
  end 
end
#binding.pry

def self.new_from_filename(artist_with_song) #"Taylor Swift - Blank Space.mp3"
  artist_with_song.split("-")
  
end



end

