class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    if name
      self.name = name 
    end 
  end

  def self.create
   new_song = Song.new
   self.all << new_song  
   new_song
  end 

  def self.new_by_name(name)
    new_song = self.new  
    #self.create returns the new song made by the class
    #method #create 
    #and then I'm altering the name of the song
    #returned by the class method
    new_song.name = name 
    new_song
  end

  def self.create_by_name(name)
    self.new_by_name(name).save 
    #line one of this method saves a new song into
    #the @@all array. line 2 of this method retrieves
    #the song name
    self.all.detect{|song| song.name == name }
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    metadata = filename.split(/( - |\.)/) 
    song = self.find_or_new_by_name(metadata[2])
    song.artist_name = metadata[0]
    song 
  end

  def self.find_or_new_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.new_by_name(name)
    end 
  end 

  def self.create_from_filename(filename)
    metadata = filename.split(/( - |\.)/) 
    song = self.find_or_create_by_name(metadata[2])
    song.artist_name = metadata[0]
    song 
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear 
  end

  def save
    self.class.all << self
  end

end
