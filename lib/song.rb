'require pry'   
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
    @@all << song 
    song
  end  
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end  
  
  def self.create_by_name(name)
    song = new_by_name(name)
    self.all << song
    song
  end   
  
   def self.find_by_name(name)
    self.all.detect{|v| v.name == name}
  end  
  
  def self.find_or_create_by_name(song_to_search)
    if self.all.empty?
      self.create_by_name(song_to_search)
    else 
      song_found = self.all.detect{|song| song.name == song_to_search}
    end  
  end 
  
  def self.new_from_filename(filename)
    filename = filename.split(/[-,.]/)
    filename.reject {|string| string == "mp3"}
    song = self.new
    song.artist_name = filename[0].strip
    song.name = filename[1].strip
    song
  end 
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end  

  
 def self.alphabetical
  self.all.sort_by {|song| song.name}
 end

  
  def self.destroy_all
    @@all.clear
  end   
    
end
 