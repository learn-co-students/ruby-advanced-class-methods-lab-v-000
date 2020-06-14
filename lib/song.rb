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
    new_song = Song.new 
    new_song.save
    new_song
   end
   
   def self.new_by_name(name)
   other_song = Song.new
   other_song.name = name
   other_song
   end
   
   def self.create_by_name(name)
     other_song = Song.new_by_name(name)
     other_song.save
     other_song
   end
   
   def self.find_by_name(name)
     @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
     find = self.find_by_name(name) 
     #binding.pry
     if find != nil
      return find
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    #binding.pry
    split_filename = filename.split(" - ")
    song_name_array = split_filename[1].split(".mp3")
    song = Song.new_by_name(song_name_array[0])
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    split_filename = filename.split(" - ")
    song_name_array = split_filename[1].split(".mp3")
    song = Song.create_by_name(song_name_array[0])
    song.artist_name = split_filename[0]
    song
  end
  
  def self.destroy_all
    self.all.clear
    
  end
    
end
