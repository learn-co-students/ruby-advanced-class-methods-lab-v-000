class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create(name)
    @name = name
    save
    name
  end
  
  def self.new_by_name(name)
  end
  
  def self.create_by_name(name)
  end
  
  def self.find_by_name(name)
  end
  
  def self.find_or_create_by_name(name)
    @@all.name.each do |existing|
      if name == existing
        "#{existing}"
      else 
        @@all << name
        
      end
    end
  end
  
  def self.alphabetical
    @@all.name.sort
  end
  
  def self.new_from_filename
    #(\[".mp3"\b])
  end
  
  def self.create_from_filename
  end
  
  def self.destroy_all
    @@all.clear
    @@all
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
