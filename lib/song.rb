require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #access @@all array in Song.all 
    @@all
  end

  def save
    self.class.all << self #adds an instance of Song to Song.all 
  end
  
  def self.create #no argument since this is being created on the Song class 
     song = self.new #instance variable @song assigned to argument value of song 
     song.save #pushes song into @@all
     song #return that added song
  end 
  
  def self.new_by_name(name) 
    song = self.new #create new song
    song.name = name #name here is equivalent to the name argument. .name is from the attr_accessor
    song
  end 

  def self.create_by_name(name)
    song = self.create #create new song and save (per above create method)
    song.name = name #name here is equivalent to the name argument. .name is from the attr_accessor
    song
  end 
  
  def self.find_by_name(name)
    self.all.detect do |song| #uses above self.all method to access the @@all class                                variable; run detect and each through the @@all array to                                find the song; could also write @@all.detect
      song.name == name 
    end
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name) #return that object
    else
      self.create_by_name(name)
    end
    # self.find_by_name(name) || self.create_by_name(name); if the first part is true, it will only evaluate that. 
  end 
  
  def self.alphabetical
    self.all.sort_by{|song| song.name} #sorts alphabetically
    #self.all.sort_by(&:name) works, too &:name is just grabbing the property name 
  end 
  
  def self.new_from_filename(filename)
    song = self.new #new object
    split_filename = filename.chomp(".mp3").split(" - ") #chops off .mp3 and adds delimiter
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end 
  
  def self.create_from_filename(filename)
    song = self.create #new object
    split_filename = filename.chomp(".mp3").split(" - ") #chops off .mp3 
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end 
  
  def self.destroy_all
    self.all.clear #calls on @@all and clears it
  end 
end
