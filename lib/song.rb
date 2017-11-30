class Song
  attr_accessor :name, :artist_name
  
  @@all = [] #creates an class variable that is set to an empty array.  Used for storage
 
  def self.all
    @@all #creates a class method to call upon the empty Array above
  end
  
  def save
    self.class.all << self
  end
  
  def self.create
    self.all << self.new #initializes a song and saves it to the @@all var.  Saves the FIRST song saved
    self.all[0]
  end 
  
  def self.new_by_name(name) #a class constructor that takes in the string name of a song and returns a song
    song = self.new #a song instance with that name set as its name property.
    song.name = name
    song
  end
  
  def self.create_by_name(name)#a class constructor that takes in the string name of a song, and returns a song
  #instance with the name set as its propery and the song being saved into the @@all class variable.
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name) #class finder that accepts the name of a string name of a song, and returns
  #the matching instance of the song with that name
    @@all.detect { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)#to prevent duplicate songs, we call on the two methods above.  This
  #method will accept a string name for a song and either return a matching song instance with that name or 
  #create a new song with the name and return the song instance.
    self.find_by_name(name)
    self.create_by_name(name)
    self.all.detect { |song| song.name == name}
  end
  
  def self.alphabetical #sorts the songs in @@all alphabetically
    @@all.sort_by{ | song | song.name }
  end
  
  def self.new_from_filename(filename) #Basically, this takes song, adds .mp3 and an artists.  
  #we had to add "-" to separate the artist and the song, and add mp3 at the end
  #example = "Taylor Swift - Blank Space.mp3"
    parts = filename.split(" - ")
    song = self.new_by_name(parts[1].chomp(".mp3"))
    song.artist_name = parts[0]
    song
  end 
  
  def self.create_from_filename(filename)# a class constructor that accepts a filename in the format of
  #"-mp3".  We piggy back off the method above
    song = self.new_from_filename(filename)
    @@all << song
    song
  end 
  
  def self.destroy_all #resets the @@all array
    @@all.clear
  end 
  
end
