class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  # Build a class method that interacts on the class data @@all
  # and provide the rest of our program with a semantic API on the
  # Song class with method such as
  
  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  # Takes in the string name of a "song" and return a song instance with that name set as its name property
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  # def self.combined (name)
  #   song = Song.new(name)
  # #  song.name = name 
  #   @@all << song
  #   song
  # end 

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  #Pseudo Code Song.find_or_create_by_name
  # Take in the name of the song. 
  # if the song is available in @@all 
  #   then return the matching song instance with that name
  # else 
  #   create a new song instance with that name and return it. 
  
  # def self.find_or_create_by_name(name)
  #   @@all.find do |song|
  #     song.name == song
  #     if song.name != name
  #       song = Song.new(name)
  #     end
  #   end
  # end
  
 
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  #   if name 
  #     self.find_by_name(name)
  #   else
  #     self.create_by_name(name)
  #   end
  # end
  
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name)
  #   if name == name
  #     name
  #   else
  #     self.create_by_name(name)
  #   end
  #   name
  # end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(name)
    song = self.new
    song.name = name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end
