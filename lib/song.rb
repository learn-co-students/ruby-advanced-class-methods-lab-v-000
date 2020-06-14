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
    songss = self.new 
    songss.save 
    songss
  end 
  
  def self.new_by_name(song_name)
    songss = self.new 
    songss.name = song_name
    songss.save 
    songss
  end
  
  def self.create_by_name(song_name)
    songss = self.new 
    songss.name = song_name
    songss.save 
    songss
  end 
  
  def self.find_by_name(song_name)
    self.all.detect {|i| i.name == song_name}
  end 
  
  def self.find_or_create_by_name(name)
   song = self.find_by_name(name)
     if song then
        return song
      else
        self.create_by_name(name)
      end
   
  end 
  
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

  def self.new_from_filename(format_song)
    new_song = self.new
    new_song.name = format_song.split(" - ")[1].split(".")[0]
    new_song.artist_name = format_song.split(" - ")[0]
    new_song
  end 
  
  def self.create_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    @@all << new_song
  end
  
  def self.destroy_all
    @@all = []
  end

end
