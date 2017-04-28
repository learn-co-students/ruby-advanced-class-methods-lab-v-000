class Song
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
# macros and vatriable creation
#--------------------------------------------------------------------------------------------
  attr_accessor :name, :artist_name
  @@all = []



#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#constructor / destructor methods
#--------------------------------------------------------------------------------------------
  def initialize
    
  end

  def save
   @@all << self 
  end
  
  def self.create
    new_song = self.new
     new_song.save
    return new_song
  end

  def self.new_by_name (name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name (name)
    new_song = self.new
    new_song.name = name
    new_song.save
    return new_song
  end


  def self.new_from_filename(filename)
  new_song = self.new
  new_song.artist_name = filename.split(" - ").first
  new_song.name = filename.split(" - ").last.chomp(".mp3")
  return new_song
  end
  
  def self.create_from_filename (filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
  self.all.clear  
  end

#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#accessor methods
#--------------------------------------------------------------------------------------------
def self.all
    return @@all
  end


def self.find_by_name(name)
@@all.detect{|curr_song|name == curr_song.name}
end

def self.alphabetical
return self.all.sort{|x,y| x.name <=> y.name}
end

#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#super duper methods
#--------------------------------------------------------------------------------------------
def self.find_or_create_by_name(name)

if !self.find_by_name(name)
self.create_by_name(name)
else
self.find_by_name(name)
end



end

end
