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

  def self.new_by_name(string)
    s = self.new 
    s.name = string
    s
  end
  
  def self.create_by_name(string)
    s = self.new
    s.name = string
    s.save
    s 
  end
  
  def self.find_by_name(string)
    self.all.detect { |i| i.name == string}
  end

  def self.find_or_create_by_name(string)
    c = self.find_by_name(string)
    if c == nil 
      self.create_by_name(string)
    else
      c
    end
  end 
  
  def self.alphabetical
    @@all.sort_by {|w| w.name}
  end
  
  def self.new_from_filename(name)
    s = self.new 
    s.name = (name.split(" - ")[1].chomp(".mp3"))
    s.artist_name = (name.split(" - ")[0])
    s
  end
  
  def self.create_from_filename(name)
    s = self.new 
    s.name = (name.split(" - ")[1].chomp(".mp3"))
    s.artist_name = (name.split(" - ")[0])
    s.save
    s
  end
  
  def self.destroy_all
    @@all = []
  end
end
