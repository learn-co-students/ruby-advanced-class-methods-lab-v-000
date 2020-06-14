

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

  def self.new_by_name(song_name)
    new_song = self.create 
    new_song.name = song_name
    new_song
  end 

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    new_song
  end 
   
  def self.find_by_name(song_name)
    @@all.detect{ |name| name.name == song_name }
  end 
  
  def self.find_or_create_by_name(song_name)
    if @@all.include?(song_name)
  
    else 
     self.create_by_name(song_name)

    end 

   end 

    def self.alphabetical
       @@all.sort_by{|x|x.name}
    end 

    
    def self.new_from_filename(fileName)
       groupName=fileName.split(".")[0].split("-")

       groupName= groupName.join(" ").split("   ")

       entry = Song.new 
       entry.name = groupName[1]
       entry.artist_name = groupName[0]
       entry

    end 

    def self.create_from_filename(fileName)
         
      file = Song.new_from_filename(fileName)
      file.save 
          
    end 

    def self.destroy_all

      @@all.clear 

    end 








end









