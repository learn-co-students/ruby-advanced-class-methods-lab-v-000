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
    @self.name = name
    @self.save
    @self
  end
  
  def self.find_by_name(song)
    binding.pry
    self.all.find{|title| title.name == song}
  end
  

     
        
end
