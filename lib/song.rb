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
  
  def self.find_by_name(name)
    self.all.find { |song_name| song_name.name == name }
  end

  def self.find_or_create_by_name(name)
    self.all.each do |x|
      if x.name == name
        self.find_by_name
      else 
        self.create_by_name
      end
    end
   end     
        
end
