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
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(named)
    new = self.new
    new.name = named
    new
  end
  
  def self.create_by_name(named)
    new = self.new
    new.name = named
    new.save
    new
  end
  
  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
    self.create_by_name(name)
    else
    self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |person|
      person.name
    end
  end
  
  def self.new_from_filename(file)
    new = self.new
    array = file.split(/\ - /)
    artist = array[0]
    array[1].slice!(".mp3")
    new.name = array[1]
    new.artist_name = artist
    new
  end
  
  def self.create_from_filename(file)
    new = self.new
    array = file.split(/\ - /)
    artist = array[0]
    array[1].slice!(".mp3")
    new.name = array[1]
    new.artist_name = artist
    new.save
    new
  end
  
  def self.destroy_all
    @@all.clear
  end
end