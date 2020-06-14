require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = [] #class variable @@

  def self.all
    @@all #and goes here!
  end

  def save
    self.class.all << self #goes here
  end

  def self.create
    song = self.new #calling itself and making a new instance, using the initialize.
    song.save #calls the save method on line 9 this...
    song
  end

  def self.new_by_name(name)
    song = self.new #creates a new song object
    song.save #saves it using save method
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect{|i| i.name == name} #@@all is an array of objects.
    #we are trying to the object by its name attribute.
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
   # you don't have to compare == name
   #if find_by_name detects the song object with that name
   #either return that object name or create one with that name.
  end

  def self.alphabetical
    @@all.sort_by do |i|
      i.name
    end
  end

  def self.new_from_filename(track_name)
    song = self.new
    song_array = track_name.split(/\ - /)
    remove_mp3 = song_array[1].split(".") #always remember arrays start at 0
    remove_mp3.pop #used pry alot to determine what is returned
    remove_mp3.flatten #and changed it accordingly.
    song_array.pop
    song_array << remove_mp3
    song_array.flatten! #flattened nested array
    song.artist_name = song_array[0]
    song.name = song_array[1]
    song #it didn't want the attributes returned but the object.
  end

  def self.create_from_filename(track_name)
    song = self.new_from_filename(track_name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
