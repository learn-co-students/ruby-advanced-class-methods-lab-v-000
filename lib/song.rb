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
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) 
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{ |obj| obj.name }
  end
  
  def self.new_from_filename(mp3)
    song = self.new
    rows = mp3.split(" - ")
    song.artist_name = rows[0]
    song.name = rows[1].chomp!(".mp3")
    song
  end
  
  def self.create_from_filename(mp3)
    song = self.new
    new_from_filename(mp3).save
    
  end

  def self.destroy_all
      self.all.clear
  end
end
