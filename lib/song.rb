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
    @self = self.new
    @self.save
    @self
  end
  
  def self.new_by_name(name)
    @self.name = name
    @self
  end
  
  def self.create_by_name(name)
    new_name = self.new
    new_name.name = name
    new_name.save
    new_name
    
  end
  
  def self.find_by_name(name)
    self.all.find{|title| title.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    
    end
  
  def self.alphabetical
    self.all.sort_by {|alphabetical|alphabetical.name.downcase}
  end
  
  def self.new_from_filename(filename)
      data = filename.split(/[-||.]/).map(&:strip)
      song = self.new
      song.artist_name = data[0]
      song.name = data[1]
      
      song
    
   
  end    

end
