require "pry"

class Song
  attr_accessor :name, :artist_name
  
  @@all = []
    
  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(string)
    song = self.new 
    song.name = "#{string}"
    song
   end
   
   def self.create_by_name(string)
     song = self.new
     song.name = "#{string}"
     @@all << song
     song
   end
   
   def self.find_by_name(string)
     @@all.find{|song| song.name == string}
   end
   
   #def self.find_by_name(string)
     #@@all.find{|person| person.name == string}
   #end
   
   def self.find_or_create_by_name(string)
     if self.find_by_name(string) == nil
       self.create_by_name(string)
       else 
         self.find_by_name(string)
     end
   end
   
   def self.alphabetical
     @@all.sort_by{|song| song.name}
   end
  
  def self.new_from_filename(string)
    new_array = string.split("- ")
    song_name = "#{new_array[1]}".gsub(".mp3",'')
    song = self.new 
    song.name = "#{song_name}"
    song.artist_name = "#{new_array[0]}".gsub(" ",'')
    song
  end
  
  def self.create_from_filename(string)
    new_array = string.split("- ")
    song_name = "#{new_array[1]}".gsub(".mp3",'')
    song = self.new 
    song.name = "#{song_name}"
    song.artist_name = "#{new_array[0]}".gsub(" ",'')
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
    
    
    
    #binding.pry
    #artist = "#{new_array[0]}"
    #self.create_by_name(string)
 
   
   
   #def self.find_or_create_by_name(string)
     #if @@all.find{|person| person.name == string} == nil
       #self.create_by_name(string)
      #elsif self.find_by_name(string)
      #end
    #end
  #end
   
   #def self.find_or_create_by_name(string)
     #if @@all.find{|person| person.name == string} == nil
       #song = self.new
       #song.name = "#{string}"
       #@@all << song
       #song
      #elsif @@all.find{|person| person.name == string} != nil
       #@@all.find{|person| person.name == string} == nil
      #end
    #end
  #end