class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name)
    @create = create
    @new_by_name = new_by_name
  end
  
  def self.create
    @@all
  end
  
  def self.new_by_name(name)
    @@all
  end
  
  def self.find_by_name(name)
    @@self.detect{|song| song.name == name} 
  end

  def save
    self.class.all << self
  end


end
