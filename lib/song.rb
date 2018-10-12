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
    song.save
    song
  end
  
  def self.new_by_name(name)
    song.create.name = name
  end
  
  def self.create_by_name(name)
    self.create 
    save
  end
  
  def self.find_by_name(name)
    @@all.find{|name| name.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == true 
      self
    else 
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    all.name.sort
  end
  
  def self.new_from_filename
    #(/[".mp3"\b/])
  end
  
  def self.create_from_filename
  end
  
  def self.destroy_all
    @@all.clear
    @@all
  end
end
