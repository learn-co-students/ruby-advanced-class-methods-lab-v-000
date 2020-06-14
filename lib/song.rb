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

def self.new_by_name(song_name)
  song = self.new 
  song.name = song_name 
  song
end 

def self.create_by_name(song_name)
   song = self.new_by_name(song_name) 
   self.all << song
   return song
  end 
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}

end 

def self.find_or_create_by_name(song_name)
  if find_by_name(song_name) == nil 
    create_by_name(song_name)
  else
    find_by_name(song_name)
  end 
end

def self.alphabetical
 return self.all.sort_by{|song| song.name}
  
   
end

 

def self.new_from_filename(name)
  song_name = name.split(" - ")
   artist_name = song_name[0]
   song_name = song_name[1].gsub(".mp3", "")

   song = self.new
   song.name = song_name
   song.artist_name = artist_name

   song 
end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end

def self.destroy_all
  @@all.clear
end 

 
end 