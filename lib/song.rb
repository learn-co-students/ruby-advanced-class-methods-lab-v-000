class Song
  attr_accessor :name, :artist_name
  @@all = [] #sets empty array for class variable @@all

  def self.all #class method
    @@all #reads @@all
  end

  def save #instance method
    self.class.all << self #saves instance to @@all
  end

  def self.create #class method
    song = self.new #instantiates new song
    @@all << song #saves the song
    song #returns the song
  end

  def self.new_by_name(name) #class method
    song = self.new #instantiates new song
    song.name = name #sets name property as the passed in name
    song #returns the song
  end

  def self.create_by_name(name) #class method
    song = self.new #instantiates new song
    song.name = name #sets passed in name as name property
    song.save #saves the song
    song #returns the property
  end

  def self.find_by_name(name) #class method
    @@all.detect{|song|song.name == name} #iterates through @@all until it finds a match and returns it
  end

  def self.find_or_create_by_name(name) #class method
    if self.find_by_name(name) == nil #looking to see if name is already in @@all
      self.create_by_name(name) # if it is not, it creates that song and adds it to @@all and returns the song
    else
      self.find_by_name(name) #if already present, searches for and returns the first match
    end
  end

  def self.alphabetical #class method
    @@all.sort_by{|song| song.name} #sorts alphabetically and returns the sorted array
  end




  def self.new_from_filename(filename) #class method
    song = self.new #instantiates new song
    song.name = filename.split(/[\-\.]/)[1].strip #sets name from parsed filename
    song.artist_name =filename.split(/[\-\.]/)[0].strip #sets artis_name from parsed filename
    song #returns song
  end

  def self.create_from_filename(filename) #class method
    song = self.new #instantiates new song
    song.name = filename.split(/[\-\.]/)[1].strip #sets name from parsed filename
    song.artist_name =filename.split(/[\-\.]/)[0].strip #sets artis_name from parsed filename
    song.save #saves the song in @@all
    song #returns the song
  end

  def self.destroy_all
    @@all.clear #empties the @@all array
  end







end
