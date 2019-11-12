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
    s = self.create
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.each do |x|
      if x.name == name
        return x
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{ |x| x.name }
  end
  
  def self.new_from_filename(name)
    x = name.gsub('.mp3', '').split(/\-/)
    s = self.create_by_name(x[1].strip)
    s.artist_name = x[0].strip
    s
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
  
  def self.destroy_all
    @@all = []
  end

end
