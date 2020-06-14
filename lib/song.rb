
class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end
  
  def self.create
    @@all << self.new
    @@all[-1]
  end
  
  def self.new_by_name(name)
    @name = name
    @@all << self.new(@name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.create_by_name(name)
  	@name = name
	  @@all << self.new(@name)
  	self.all.detect{|song| song.name == name}
  end 
  
  def self.find_by_name(name)
  	@name = name
  	self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(name)
    @name = name.split(" - ")[1].chomp(".mp3")
    @artist_name = name.split(" - ")[0]
    @@all << self.new(@name, @artist_name)
    self.all.detect{|song| song.name == name.split(" - ")[1].chomp(".mp3")}
  end
  
  def self.create_from_filename(name)
    @name = name.split(" - ")[1].chomp(".mp3")
    @artist_name = name.split(" - ")[0]
    @@all << self.new(@name, @artist_name)
    self.all.detect{|song| song.name == name.split(" - ")[1].chomp(".mp3")}
  end
  
  
  def self.destroy_all
    self.all.clear
  end
end
