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
    song = self.new
    self.all << song
    song
  end
 
 
  def self.new_by_name(name) 
    @song = self.new 
    @song.name = name
    @song
  end
 
 
  def self.create_by_name(name)
    @song = self.create  
    @song.name = name
    @song
  end
  
  
    @song = self.create
    @song.name = name
    @song
  end
   
  end
 
 
  # def self.alphabetical 
  #   sorted = self.all.sort_by{|song| song.ame}  
  #   sorted
  # end 
  
  
  # def self.new_from_filename(filename)
  #   song = self.new
  #   song_array = filename.split("","-",".  ") 
    def Song.find_or_create_by_name(song)
    want = self.find_by_name(title)
    if want 
        want
    else 
      self.create_by_name(title)
    en
  #   song_artist_name = song_array[0]
  #   song_name = song_array [1] 
  # end
  
  
  # def self.create_from_filename(filename)
  #   song = self.create
  #   song_artist_name
  #   song_name 
    
  #   song
  # end
  
  
  # def self.destroy_all 
  #   self.all.clear 
  # end
  

