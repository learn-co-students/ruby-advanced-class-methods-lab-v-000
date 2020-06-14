class Song
  attr_accessor :name, :artist_name, :file 
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    return @@all[-1]  
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    @@all << song 
    return @@all[-1]  
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song 
    return @@all[-1]  
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name) 
    end 
  end

  def self.alphabetical
    @@all.sort! {|a,b| a.name <=> b.name}
  end 

  def self.new_from_filename(file)
    song = self.new
    data = file.chomp('.mp3').split(' - ')
    name = data[1]
    artist_name = data[0]
    song.name = name
    song.artist_name = artist_name
    song 
  end 

  def self.create_from_filename(file)
    song = self.new 
    data = file.chomp('.mp3').split(' - ')
    name = data[1]
    artist_name = data[0]
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song 
  end 

  def self.destroy_all
    self.all.clear 
  end 

end
