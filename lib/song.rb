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
    s = self.new
    s.save
    s
  end
  
  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = self.new 
    s.name = name 
    s.save
    s
  end
  
  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
  end
  
def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(name)
     c = self.new 
    c.name = name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end
  def self.create_from_filename(name)
    s = self.new
    s.name = name.split(/[^a-zA-Z\s]|\s-\s/)[1]
    s.artist_name = name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    s.save
    s
  end
  def self.destroy_all
    self.all.clear
  end
end
