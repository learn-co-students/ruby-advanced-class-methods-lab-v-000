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
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = Song.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
     a = filename.split("-") 
     a[1] = a[1][0...-4]
     s = Song.new
     s.name = a[1].strip
     s.artist_name = a[0].strip
     s
  end

  def self.create_from_filename(filename)
    a = filename.split("-") 
     a[1] = a[1][0...-4]
     s = Song.new
     s.name = a[1].strip
     s.artist_name = a[0].strip
     s.save
  end

  def self.destroy_all
    @@all = []
  end


end
