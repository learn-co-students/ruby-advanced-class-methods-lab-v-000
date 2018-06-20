require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
  def self.create
    #instantiates a new Song
    #saves the Song
    #finally returns the Song
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    #instantiates a song with a name property
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(string_name)
    #instantiate 
    #save song
    #return the property of name 
    song = self.new 
    song.name = string_name
    song.save 
    song
  end
  
  def self.find_by_name(name)
    #find a song in @@all
    #search by name
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name)
    else self.create_by_name(name) 
    end
  end
  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
    # binding.pry
  end
  
  def self.create_from_filename(filename)
    # song = song.new
    # self.new_from_filename = filename
    split_filename = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  # binding.pry
  end
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all = []
  end

end
